import { __awaiter } from "tslib";
import { createStore } from "vuex";
import firebase from "firebase/compat";
import { stringResources } from "@/utils/constants";
var AuthState;
(function (AuthState) {
  AuthState[(AuthState["anonymous"] = 0)] = "anonymous";
  AuthState[(AuthState["loading"] = 1)] = "loading";
  AuthState[(AuthState["signed"] = 2)] = "signed";
})(AuthState || (AuthState = {}));
class StateModel {
  constructor() {
    this.fToken = "";
    this.authState = AuthState.loading;
    this.userName = stringResources.ANONYMOUS;
  }
}
const store = createStore({
  state: new StateModel(),
  mutations: {
    authLoading(state) {
      state.authState;
    },
    updateUserInfo(state, payload) {
      state.userName = payload.userName;
    },
    authAnonymous(state) {
      state.authState = AuthState.anonymous;
    },
  },
  actions: {
    signIn(context) {
      return __awaiter(this, void 0, void 0, function* () {
        yield context.dispatch("signInAnonymously");
      });
    },
    signInAnonymously(context) {
      return __awaiter(this, void 0, void 0, function* () {
        context.commit("authLoading");
        const credentials = yield firebase.auth().signInAnonymously();
        context.commit("updateUserInfo", {
          userName: stringResources.ANONYMOUS,
        });
        context.commit("authAnonymous");
      });
    },
    openUserProfile() {},
  },
  getters: {},
});
export { store, AuthState };
//# sourceMappingURL=store.js.map
