import axios from 'axios'

const backend_port = 999;
const api = axios.create({
    baseURL: `http://localhost:${backend_port}`,
})

async function basicRequest() {
    let response;

    await api.get(
        '/'
    ).then((res) => {
        response = res.data.message
    }).catch((error) => {
        response = error
    })
}

export {basicRequest}