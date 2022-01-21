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
                    const { data, error } = yield supabase.from(constants_1.dbConstants.chatsTable)
                        .select().eq('id', uid);
                    res.json(data);
                }));
            }
        }
        res.json({
            message: 'Hello World!'
        });
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
