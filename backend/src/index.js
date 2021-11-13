"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const app = (0, express_1.default)();
const port = 999;
function main() {
    console.log('Hi! Starting backend... on beauty port: 999');
    console.log(`https://127.0.0.1:${port}`);
}
///Starting main :)
main();
