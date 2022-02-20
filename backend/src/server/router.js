"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.router = void 0;
const firebase_admin_1 = require("firebase-admin");
const supabase_js_1 = require("@supabase/supabase-js");
const constants_1 = require("../utils/constants");
const express_fileupload_1 = __importDefault(require("express-fileupload"));
function router(app) {
    const supabase = (0, supabase_js_1.createClient)(constants_1.dbConstants.supabaseUrl, process.env.SUPA_SECRET);
    app.use('/', checkAuth);
    app.use((0, express_fileupload_1.default)({
        limits: { fileSize: 50 * 1024 * 1024 },
    }));
    app.get('/', (req, res) => {
        res.json({
            message: 'Hello World!'
        });
    });
    app.post('/chats', (req, res) => {
        let token = req.headers.authtoken;
        if (token) {
            if (typeof token === "string") {
                (0, firebase_admin_1.auth)().verifyIdToken(token).then((decodedToken) => __awaiter(this, void 0, void 0, function* () {
                    let uid = decodedToken.uid;
                    let tUid = yield getTrueId(supabase, uid);
                    const { data, error } = yield supabase.from(constants_1.dbConstants.chatsTable)
                        .select().or('user_a.eq.' + tUid + ',user_b.eq.' + tUid);
                    let list = [];
                    if (data) {
                        for (let i = 0; i < data.length; i++) {
                            let el = data[i];
                            let userA = yield getUserByInternalId(supabase, el.user_a);
                            let userB = yield getUserByInternalId(supabase, el.user_b);
                            let chatModel = {
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
                }));
            }
        }
    });
    app.post('/user', (req, res) => {
        let token = req.headers.authtoken;
        if (token) {
            if (typeof token === "string") {
                (0, firebase_admin_1.auth)().verifyIdToken(token).then((decodedToken) => __awaiter(this, void 0, void 0, function* () {
                    let uid = decodedToken.uid;
                    let { data, error } = yield supabase.from(constants_1.dbConstants.usersTable)
                        .select().match({ 'uid': uid });
                    if (typeof data !== 'undefined' && data.length > 0) {
                        res.json(data[0]);
                    }
                    else {
                        data = yield createUser(supabase, uid);
                        res.json(data);
                    }
                }));
            }
        }
    });
    app.post('/user/update_user', (req, res) => {
        let token = req.headers.authtoken;
        let userData = req.body.user;
        if (token) {
            if (typeof token === "string") {
                (0, firebase_admin_1.auth)().verifyIdToken(token).then((decodedToken) => __awaiter(this, void 0, void 0, function* () {
                    let uid = decodedToken.uid;
                    const { data, error } = yield supabase.from(constants_1.dbConstants.usersTable).update(userData).match({ uid: uid });
                    if (data) {
                        yield res.status(200).send();
                    }
                    else {
                        yield res.status(400).send();
                    }
                }));
            }
        }
    });
    app.post('/chats/update_chat', (req, res) => {
        let token = req.headers.authtoken;
        let anotherUid = req.body.anotherUid;
        if (token) {
            if (typeof token === "string") {
                (0, firebase_admin_1.auth)().verifyIdToken(token).then((decodedToken) => __awaiter(this, void 0, void 0, function* () {
                    let uid = decodedToken.uid;
                    let tUid = yield getTrueId(supabase, uid);
                    let tAUid = yield getTrueId(supabase, anotherUid);
                    const { data, error } = yield supabase.from(constants_1.dbConstants.chatsTable).insert({
                        user_a: tUid,
                        user_b: tAUid
                    });
                    if (data) {
                        res.status(200).send();
                    }
                    else {
                        res.status(400).send();
                    }
                }));
            }
        }
    });
    app.post('/chats/messages', (req, res) => {
        let token = req.headers.authtoken;
        let chatId = req.body.chatId;
        if (token) {
            if (typeof token === "string") {
                (0, firebase_admin_1.auth)().verifyIdToken(token).then((decodedToken) => __awaiter(this, void 0, void 0, function* () {
                    let uid = decodedToken.uid;
                    let tUid = yield getTrueId(supabase, uid);
                    let rawMessages = yield messages(supabase, chatId);
                    let userFiendlyMessages = [];
                    if (rawMessages.length > 0) {
                        for (let i = 0; i < rawMessages.length; i++) {
                            let rawMessage = rawMessages[i];
                            let rawAttachments = yield attachments(supabase, rawMessage.id);
                            if (rawAttachments.length > 0) {
                                rawAttachments.forEach(function (p1, p2, p3) {
                                    p1.message_id = null;
                                }, undefined);
                                let message = {
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
                }));
            }
        }
    });
    app.post('/chats/update_message', (req, res) => {
        let token = req.headers.authtoken;
        let chatId = req.body.chatId;
        let rawMessage = req.body.message;
        let message = req.body.message;
        // let files = req.files;
        if (token) {
            if (typeof token === "string") {
                (0, firebase_admin_1.auth)().verifyIdToken(token).then((decodedToken) => __awaiter(this, void 0, void 0, function* () {
                    let uid = decodedToken.uid;
                    ///parse data from client
                    let id = yield getTrueId(supabase, uid);
                    let messageBase = yield createMessage(supabase, id, chatId);
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
                    let uploadedAttachments = yield createAttachments(supabase, attachments);
                    if (uploadedAttachments.length > 0) {
                        res.status(200).send();
                    }
                    else {
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
                }));
            }
        }
    });
}
exports.router = router;
let authorized = true;
function checkAuth(req, res, next) {
    let token = req.headers.authtoken;
    if (token) {
        (0, firebase_admin_1.auth)().verifyIdToken(token)
            .then(() => {
            next();
        }).catch(() => {
            res.status(403).send('Unauthorized');
        });
    }
    else {
        res.status(403).send('Unauthorized');
    }
}
function getTrueId(supabase, uid) {
    return __awaiter(this, void 0, void 0, function* () {
        let { data, error } = yield supabase.from(constants_1.dbConstants.usersTable)
            .select().match({ 'uid': uid });
        if (typeof data !== 'undefined' && data.length > 0) {
            return data[0].id;
        }
    });
}
function getUserByInternalId(supabase, id) {
    return __awaiter(this, void 0, void 0, function* () {
        let { data, error } = yield supabase.from(constants_1.dbConstants.usersTable)
            .select().match({ 'id': id });
        if (typeof data !== 'undefined' && data.length > 0) {
            return data[0];
        }
    });
}
function createUser(supabase, uid) {
    return __awaiter(this, void 0, void 0, function* () {
        const obj = { uid: uid };
        const { data, error } = yield supabase.from(constants_1.dbConstants.usersTable).insert(obj);
        return data[0];
    });
}
function updateUser(supabase, user) {
    return __awaiter(this, void 0, void 0, function* () {
        const { data, error } = yield supabase.from(constants_1.dbConstants.usersTable).update(user);
    });
}
function createMessage(supabase, id, chatId) {
    return __awaiter(this, void 0, void 0, function* () {
        let { data, error } = yield supabase.from(constants_1.dbConstants.messagesTable).insert({ message_sender_id: id, chat_id: chatId });
        return data[0];
    });
}
function messages(supabase, chatId) {
    return __awaiter(this, void 0, void 0, function* () {
        let { data, error } = yield supabase.from(constants_1.dbConstants.messagesTable).select().match({ chat_id: chatId });
        return data !== null && data !== void 0 ? data : [];
    });
}
function attachments(supabase, messageId) {
    return __awaiter(this, void 0, void 0, function* () {
        let { data, error } = yield supabase.from(constants_1.dbConstants.attachmentsTable).select().match({ message_id: messageId });
        return data !== null && data !== void 0 ? data : [];
    });
}
function createAttachments(supabase, attachments) {
    return __awaiter(this, void 0, void 0, function* () {
        let { data, error } = yield supabase.from(constants_1.dbConstants.attachmentsTable).insert(attachments);
        return data !== null && data !== void 0 ? data : [];
    });
}
//# sourceMappingURL=router.js.map