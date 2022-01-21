import {Express} from "express";
import {auth} from "firebase-admin";
import {createClient} from "@supabase/supabase-js";
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
                    res.json(data);
                });
            }
        }
    });
    app.post('/chats/create_chat', (req, res) => {
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


export {router}