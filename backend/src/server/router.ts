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
                    let tUid = await getTrueId(supabase, uid);

                    const {data, error} = await supabase.from(dbConstants.chatsTable)
                        .select().or('user_a.eq.' + tUid + ',user_b.eq.' + tUid);

                    let list = [];
                    for (let i = 0; i < data.length; i++) {
                        let el: ChatModel = data[i];
                        let userA = await getUserByInternalId(supabase, el.user_a);
                        let userB = await getUserByInternalId(supabase, el.user_b);
                        let chatModel: ChatModelFourUser = {
                            id: el.id,
                            created_at: el.created_at,
                            user_a: userA,
                            user_b: userB,
                            messages_list_id: el.messages_list_id,
                            last_message: el.last_message,
                        };
                        list.push(chatModel);
                    }
                    res.status(200).json(list);
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
                        .select().match({'uid': uid});
                    if (typeof data !== 'undefined' && data.length > 0) {
                        res.json(data[0]);
                    } else {
                        data = await createUser(supabase, uid);
                        res.json(data);
                    }
                });
            }
        }
    });

    app.post('/user/update_user', (req, res) => {
        let token = req.headers.authtoken;
        let userData: UserModel = req.body.user;
        if (token) {
            if (typeof token === "string") {
                auth().verifyIdToken(token).then(async (decodedToken) => {
                    let uid = decodedToken.uid;

                    const {
                        data,
                        error
                    } = await supabase.from(dbConstants.usersTable).update(userData).match({uid: uid});
                    if (data) {
                        await res.status(200).send();
                    } else {
                        await res.status(400).send();
                    }
                });
            }
        }
    });

    app.post('/chats/update_chat', (req, res) => {
        let token = req.headers.authtoken;
        let anotherUid: string = req.body.anotherUid;
        if (token) {
            if (typeof token === "string") {
                auth().verifyIdToken(token).then(async (decodedToken) => {
                    let uid = decodedToken.uid;

                    let tUid = await getTrueId(supabase, uid);
                    let tAUid = await getTrueId(supabase, anotherUid);

                    const {data, error} = await supabase.from(dbConstants.chatsTable).insert({
                        user_a: tUid,
                        user_b: tAUid
                    });
                    if (data) {
                        res.status(200).send();
                    } else {
                        res.status(400).send();
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

async function getTrueId(supabase: SupabaseClient, uid: string): Promise<number> {
    let {data, error} = await supabase.from(dbConstants.usersTable)
        .select().match({'uid': uid});
    if (typeof data !== 'undefined' && data.length > 0) {
        return data[0].id;
    }
}

async function getUserByInternalId(supabase: SupabaseClient, id: number): Promise<UserModel> {
    let {data, error} = await supabase.from(dbConstants.usersTable)
        .select().match({'id': id});
    if (typeof data !== 'undefined' && data.length > 0) {
        return data[0];
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