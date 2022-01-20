"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.router = void 0;
const firebase_admin_1 = require("firebase-admin");
function router(app) {
    app.use('/', checkAuth);
    app.get('/', (req, res) => {
        res.json({
            message: 'Hello World!'
        });
    });
}
exports.router = router;
let authorized = true;
function checkAuth(req, res, next) {
    if (req.headers.authtoken) {
        (0, firebase_admin_1.auth)().verifyIdToken(req.headers.authtoken)
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
