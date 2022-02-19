import * as http from 'http';
import * as WebSocket from 'ws';
import express from "express";

const app = express();
const server = http.createServer(app);

//initialize the WebSocket server instance
const wss = new WebSocket.Server({server});

wss.on('connection', (ws: WebSocket) => {
    let token: string;

    //connection is up, let's add a simple simple event
    ws.on('message', (message: string) => {

        //log the received message and send it back to the client
        console.log('received: %s', message);
        ws.send(`Hello, you sent -> ${message}`);
    });

    //send immediatly a feedback to the incoming connection
    ws.send('Hi there, I am a WebSocket server');
});


export {wss, server};