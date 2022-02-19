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
Object.defineProperty(exports, "__esModule", { value: true });
exports.router = void 0;
const firebase_admin_1 = require("firebase-admin");
const supabase_js_1 = require("@supabase/supabase-js");
const constants_1 = require("../utils/constants");
function router(app) {
    const supabase = (0, supabase_js_1.createClient)(constants_1.dbConstants.supabaseUrl, process.env.SUPA_SECRET);
    app.use('/', checkAuth);
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
    app.post('/messages/update_message', (req, res) => {
        let token = req.headers.authtoken;
        let anotherUid = req.body.aUid;
        if (token) {
            if (typeof token === "string") {
                (0, firebase_admin_1.auth)().verifyIdToken(token).then((decodedToken) => __awaiter(this, void 0, void 0, function* () {
                    let uid = decodedToken.uid;
                    ///parse data from client
                    ///upload image if everethyng okay
                    const { data, error } = yield supabase.from(constants_1.dbConstants.chatsTable).insert({
                        user_a: uid,
                        user_b: anotherUid
                    });
                    if (data) {
                        res.status(200);
                    }
                    else {
                        res.status(400);
                    }
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
//# sourceMappingURL=router.js.map