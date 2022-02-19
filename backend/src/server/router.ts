import {Express} from "express";
import {auth} from "firebase-admin";
import {createClient, SupabaseClient} from "@supabase/supabase-js";
import {dbConstants} from "../utils/constants";

export {
    PostgrestResponse, PostgrestSingleResponse, PostgrestMaybeSingleResponse, PostgrestError,
} from '@supabase/postgrest-js';

function router(app: Express) {
    const supabase = createClient(dbConstants.supabaseUrl, process.env.SUPA_SECRET!)

    app.use('/', checkAuth)
    app.get('/', (req, res) => {
        res.json({
            message: 'Hello World!'
        })
    });
    app.post('/chats', (req, res) => {
        let token = req.headers.authtoken;
        if (token) {
            if (typeof token === "string") {
                auth().verifyIdToken(token).then(async (decodedToken) => {
                    let uid = decodedToken.uid;
                    const {data, error} = await supabase.from(dbConstants.chatsTable)
                        .select().eq('id', uid);

                    res.status(200).json(data ?? []);
                });
            }
        }
    });
    app.post('/user', (req, res) => {
        let token = req.headers.authtoken;
        if (token) {
            if (typeof token === "string") {
                auth().verifyIdToken(token).then(async (decodedToken) => {
                    let uid = decodedToken.uid;
                    let {data, error} = await supabase.from(dbConstants.usersTable)
                        .select().eq('uid', uid);
                    if (!data) {
                        data = await createUser(supabase, uid);
                        res.json(data);
                    } else {
                        res.json(data);
                    }
                });
            }
        }
    });

    app.post('/user/update_user', (req, res) => {
        let token = req.headers.authtoken;
        let userData: UserModel = req.body.userData;
        if (token) {
            if (typeof token === "string") {
                auth().verifyIdToken(token).then(async (decodedToken) => {
                    let uid = decodedToken.uid;

                    const {
                        data,
                        error
                    } = await supabase.from(dbConstants.usersTable).update({}).match({uid: uid});
                    if (data) {
                        res.status(200);
                    } else {
                        res.status(400);
                    }
                });
            }
        }
    });

    app.post('/chats/update_chat', (req, res) => {
        let token = req.headers.authtoken;
        let anotherUid = req.body.aUid;
        if (token) {
            if (typeof token === "string") {
                auth().verifyIdToken(token).then(async (decodedToken) => {
                    let uid = decodedToken.uid;
                    const {data, error} = await supabase.from(dbConstants.chatsTable).insert({
                        user_a: uid,
                        user_b: anotherUid
                    });
                    if (data) {
                        res.status(200);
                    } else {
                        res.status(400);
                    }
                });
            }
        }
    });


    app.post('/messages/update_message', (req, res) => {
        let token = req.headers.authtoken;
        let anotherUid = req.body.aUid;
        if (token) {
            if (typeof token === "string") {
                auth().verifyIdToken(token).then(async (decodedToken) => {
                    let uid = decodedToken.uid;
                    ///parse data from client


                    ///upload image if everethyng okay

                    const {data, error} = await supabase.from(dbConstants.chatsTable).insert({
                        user_a: uid,
                        user_b: anotherUid
                    });
                    if (data) {
                        res.status(200);
                    } else {
                        res.status(400);
                    }
                });
            }
        }
    });
}

let authorized = true

function checkAuth(req: any, res: any, next: any) {
    let token = req.headers.authtoken;
    if (token) {
        auth().verifyIdToken(token)
            .then(() => {
                next()
            }).catch(() => {
            res.status(403).send('Unauthorized')
        });
    } else {
        res.status(403).send('Unauthorized')
    }
}


async function createUser(supabase: SupabaseClient, uid: string): Promise<any> {
    const obj: UserModel = {uid: uid};
    const {data, error} = await supabase.from(dbConstants.usersTable).insert(obj);
    return data[0];
}

async function updateUser(supabase: SupabaseClient, user: UserModel): Promise<any> {
    const {data, error} = await supabase.from(dbConstants.usersTable).update(user);
}


export {router}