import {Express} from "express";
import {auth} from "firebase-admin";

function router(app: Express) {
    app.use('/', checkAuth)
    app.get('/', (req, res) => {
        res.json({
            message: 'Hello World!'
        })
    });
}

let authorized = true

function checkAuth(req: any, res: any, next: any) {
    if (req.headers.authtoken) {
        auth().verifyIdToken(req.headers.authtoken)
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