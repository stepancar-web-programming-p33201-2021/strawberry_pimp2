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
const app_1 = require("./server/app");
const mongoose_1 = __importDefault(require("mongoose"));
const constants_1 = require("./utils/constants");
const router_1 = require("./server/router");
const port = 999;
function main() {
    return __awaiter(this, void 0, void 0, function* () {
        console.log(constants_1.funnyComments.startComment + port);
        console.log(`${constants_1.typicalDefaults.localHostUrl}:${port}`);
        yield mongoose_1.default.connect(`${constants_1.dbConstants.localHostMongo}/${constants_1.dbConstants.mainDB}`);
        (0, router_1.router)(app_1.app);
        app_1.app.listen(port, () => {
            console.log(`StrawberryPimp app listening at http://localhost:${port}`);
        });
    });
}
///Starting main :)
main();
