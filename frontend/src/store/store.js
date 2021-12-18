import { __awaiter } from "tslib";
import { createStore } from "vuex";
import firebase from "firebase/compat";
import { stringResources } from "@/utils/constants";
import { getAuth, signInWithPopup, GoogleAuthProvider, onAuthStateChanged, } from "firebase/auth";
var AuthState;
(function (AuthState) {
    AuthState[AuthState["anonymous"] = 0] = "anonymous";
    AuthState[AuthState["loading"] = 1] = "loading";
    AuthState[AuthState["signed"] = 2] = "signed";
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
        updateUserInfo(state, payload) {
            state.userName = payload.userName;
        },
        authWith(state, authState) {
            state.authState = authState;
        },
    },
    actions: {
        signIn(context) {
            return __awaiter(this, void 0, void 0, function* () {
                context.commit("authWith", AuthState.loading);
                const auth = getAuth();
                onAuthStateChanged(auth, (user) => {
                    if (user) {
                        context.commit("updateUserInfo", { userName: user.displayName });
                        context.commit("authWith", AuthState.signed);
                    }
                    else {
                        context.commit("updateUserInfo", {
                            userName: stringResources.ANONYMOUS,
                        });
                        context.commit("authWith", AuthState.anonymous);
                    }
                });
            });
        },
        authWithGoogle(context) {
            return __awaiter(this, void 0, void 0, function* () {
                context.commit("authWith", AuthState.loading);
                const provider = new GoogleAuthProvider();
                const auth = getAuth();
                yield signInWithPopup(auth, provider)
                    .then((result) => {
                    const credential = GoogleAuthProvider.credentialFromResult(result);
                    if (credential !== null) {
                        return firebase.auth().signInWithCredential(credential);
                    }
                })
                    .catch((error) => {
                });
                yield context.dispatch("signIn");
            });
        },
        openUserProfile() {
        },
        openUserAuth() {
        },
        tryOpenUserProfile(context) {
            if (context.state.authState === AuthState.anonymous) {
                context.dispatch("openUserAuth");
            }
            if (context.state.authState === AuthState.signed) {
                context.dispatch("openUserProfile");
            }
        },
    },
    getters: {},
});
export { store, AuthState };
//# sourceMappingURL=store.js.map