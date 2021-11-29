import axios from "axios";
import firebase from "firebase/compat";

const backend_port = 999;
const api = axios.create({
    baseURL: `http://localhost:${backend_port}`,
});

function firebaseIdToken(): Promise<string> {
    const user = firebase.auth().currentUser!;
    return user.getIdToken();
}

async function basicRequest() {
    let response;

    await api
        .get("/")
        .then((res) => {
            response = res.data.message;
        })
        .catch((error) => {
            response = error;
        });
}

export {basicRequest};
