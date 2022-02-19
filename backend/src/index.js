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
const app_1 = require("./server/app");
const constants_1 = require("./utils/constants");
const router_1 = require("./server/router");
const utils_1 = require("./utils/utils");
const app_2 = require("firebase-admin/app");
const firebase_admin_1 = require("firebase-admin");
const ws_1 = require("./server/ws/ws");
const port = 999;
const serviceAccount = require("./config/mistic_chat_key.json");
function main() {
    return __awaiter(this, void 0, void 0, function* () {
        (0, utils_1.print)(constants_1.funnyComments.startComment + port);
        (0, utils_1.print)(`${constants_1.typicalDefaults.localHostUrl}:${port}`);
        yield (0, app_2.initializeApp)({
            credential: firebase_admin_1.credential.cert(serviceAccount),
        });
        (0, router_1.router)(app_1.app);
        app_1.app.listen(port, () => {
            (0, utils_1.print)(`StrawberryPimp app listening at http://localhost:${port}`);
        });
        ws_1.server.listen(process.env.PORT || 8999, () => {
            const address = ws_1.server.address();
            (0, utils_1.print)(`ws Server started on port ${typeof address == "string" ? address : address.port} :)`);
        });
    });
}
///Starting main :)
let promise = main();
//# sourceMappingURL=index.js.map