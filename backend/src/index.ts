import {app} from "./server/app";
import mongoose from 'mongoose';
import {dbConstants, funnyComments, typicalDefaults} from "./utils/constants";
import {google} from 'googleapis';
import {router} from "./server/router";
import {print} from "./utils/utils";
import {initializeApp} from "firebase-admin/app";
import {credential} from "firebase-admin";


const port = 999;
const serviceAccount = require("./config/fbp_strawberrypimp_key.json");

async function main() {
    print(funnyComments.startComment + port)
    print(`${typicalDefaults.localHostUrl}:${port}`)
    await mongoose.connect(`${dbConstants.localHostMongo}/${dbConstants.mainDB}`);
    await initializeApp({
        credential: credential.cert(serviceAccount),
    });
    router(app);
    app.listen(port, () => {
        print(`StrawberryPimp app listening at http://localhost:${port}`)
    })
}

///Starting main :)
let promise = main();