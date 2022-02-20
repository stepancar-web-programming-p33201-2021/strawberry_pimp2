import {Express} from "express";
import {auth} from "firebase-admin";
import {createClient, SupabaseClient} from "@supabase/supabase-js";
import {dbConstants} from "../utils/constants";
import fileUpload from "express-fileupload";

export {
    PostgrestResponse, PostgrestSingleResponse, PostgrestMaybeSingleResponse, PostgrestError,
} from '@supabase/postgrest-js';

function router(app: Express) {
    const supabase = createClient(dbConstants.supabaseUrl, process.env.SUPA_SECRET!)

    app.use('/', checkAuth)
    app.use(fileUpload({
        limits: {fileSize: 50 * 1024 * 1024},
    }));


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
                    if (data) {
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


    app.post('/chats/messages', (req, res) => {
        let token = req.headers.authtoken;
        let chatId: number = req.body.chatId;
        if (token) {
            if (typeof token === "string") {
                auth().verifyIdToken(token).then(async (decodedToken) => {
                    let uid = decodedToken.uid;
                    let tUid = await getTrueId(supabase, uid);

                    let rawMessages = await messages(supabase, chatId);

                    let userFiendlyMessages: MessageModel[] = [];
                    if (rawMessages.length > 0) {
                        for (let i = 0; i < rawMessages.length; i++) {
                            let rawMessage = rawMessages[i];
                            let rawAttachments = await attachments(supabase, rawMessage.id);
                            if (rawAttachments.length > 0) {
                                rawAttachments.forEach(function (p1: AttachmentModel, p2: number, p3: AttachmentModel[]) {
                                    p1.message_id = null;
                                }, undefined);
                                let message: MessageModel = {
                                    attachments: rawAttachments,
                                    id: rawMessage.id,
                                    created_at: rawMessage.created_at,
                                    read_at: rawMessage.read_at,
                                    updated_at: rawMessage.updated_at,
                                    message_sender: rawMessage.message_sender_id == tUid ? 'a' : 'b',
                                };
                                userFiendlyMessages.push(message);
                            }
                        }
                    }

                    // const {data, error} = await supabase.from(dbConstants.chatsTable)
                    //     .select().or('user_a.eq.' + tUid + ',user_b.eq.' + tUid);

                    let list = [];

                    res.status(200).json(userFiendlyMessages);
                });
            }
        }
    });

    app.post('/chats/update_message', (req, res) => {
        let token = req.headers.authtoken;
        let chatId: number = req.body.chatId;
        let rawMessage = req.body.message;
        let message: MessageModel = req.body.message;
        // let files = req.files;

        if (token) {
            if (typeof token === "string") {
                auth().verifyIdToken(token).then(async (decodedToken) => {
                    let uid = decodedToken.uid;
                    ///parse data from client

                    let id = await getTrueId(supabase, uid);
                    let messageBase = await createMessage(supabase, id, chatId);


                    let attachments = message.attachments;
                    if (attachments.length > 0) {
                        for (let i = 0; i < attachments.length; i++) {
                            let attachment = attachments[i];
                            attachment.message_id = messageBase.id;
                            // if (attachment.type != AttachmentType.text) {
                            //     let numberList: number[] = attachment.uint8list!;
                            //     let uint = Uint8Array.from(numberList);
                            //     const {data, error} = await supabase.storage
                            //         .from('users')
                            //         .upload(id + '/files/' + chatId + '/' + Date.now() + '_' + attachment.content, uint);
                            //     console.log(data);
                            // }
                        }
                    }


                    let uploadedAttachments = await createAttachments(supabase, attachments);
                    if (uploadedAttachments.length > 0) {
                        res.status(200).send();
                    }else{
                        res.status(400).send();
                    }


                    // const {data, error} = await supabase.from(dbConstants.attachmentsTable).insert({
                    //     user_a: uid,
                    //     user_b: anotherUid
                    // });

                    ///0. create if no list id message and upload it to chat object
                    ///1. upload attachments
                    ///2. upload message

                    ///upload image if everethyng okay

                    // const {data, error} = await supabase.from(dbConstants.chatsTable).insert({
                    //     user_a: uid,
                    //     user_b: anotherUid
                    // });



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

async function createMessage(supabase: SupabaseClient, id: number, chatId: number): Promise<MessageTableElement> {
    let {data, error} = await supabase.from(dbConstants.messagesTable).insert({message_sender_id: id, chat_id: chatId});
    return data[0];
}


async function messages(supabase: SupabaseClient, chatId: number): Promise<MessageTableElement[]> {
    let {data, error} = await supabase.from(dbConstants.messagesTable).select().match({chat_id: chatId});
    return data ?? [];
}

async function attachments(supabase: SupabaseClient, messageId: number): Promise<AttachmentModel[]> {
    let {data, error} = await supabase.from(dbConstants.attachmentsTable).select().match({message_id: messageId});
    return data ?? [];
}

async function createAttachments(supabase: SupabaseClient, attachments: AttachmentModel[]): Promise<AttachmentModel[]> {
    let {data, error} = await supabase.from(dbConstants.attachmentsTable).insert(attachments);
    return data ?? [];
}


export {router}