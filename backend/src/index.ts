import {app} from "./server/app";
import {dbConstants, funnyComments, typicalDefaults} from "./utils/constants";
import {google} from 'googleapis';
import {router} from "./server/router";
import {print} from "./utils/utils";
import {initializeApp} from "firebase-admin/app";
import {credential} from "firebase-admin";
import {createClient} from "@supabase/supabase-js";
import {server} from "./server/ws/ws";


const port = 999;
const serviceAccount = require("./config/mistic_chat_key.json");

async function main() {
    print(funnyComments.startComment + port)
    print(`${typicalDefaults.localHostUrl}:${port}`)

    await initializeApp({
        credential: credential.cert(serviceAccount),
    });
    router(app);
    app.listen(port, () => {
        print(`StrawberryPimp app listening at http://localhost:${port}`)
    });
    server.listen(process.env.PORT || 8999, () => {
        const address = server.address();
        print(`ws Server started on port ${typeof address == "string" ? address : address.port} :)`);
    });
}

///Starting main :)
let promise = main();