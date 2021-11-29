import { __awaiter } from "tslib";
import axios from "axios";
import firebase from "firebase/compat";
const backend_port = 999;
const api = axios.create({
  baseURL: `http://localhost:${backend_port}`,
});
function firebaseIdToken() {
  const user = firebase.auth().currentUser;
  return user.getIdToken();
}
function basicRequest() {
  return __awaiter(this, void 0, void 0, function* () {
    let response;
    yield api
      .get("/")
      .then((res) => {
        response = res.data.message;
      })
      .catch((error) => {
        response = error;
      });
  });
}
export { basicRequest };
//# sourceMappingURL=api.js.map
