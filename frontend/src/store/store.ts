import {createStore} from "vuex";
import firebase from "firebase/compat";
import {stringResources} from "@/utils/constants";
import {getAuth, signInWithPopup, GoogleAuthProvider, onAuthStateChanged} from "firebase/auth";

enum AuthState {
    anonymous,
    loading,
    signed
}

class StateModel {
    fToken: string = '';
    authState: AuthState = AuthState.loading;
    userName: string = stringResources.ANONYMOUS;
}


const store = createStore({
    state: new StateModel(),
    mutations: {
        updateUserInfo(state, payload) {
            state.userName = payload.userName;
        },
        authWith(state, authState: AuthState) {
            state.authState = authState;
        }
    },
    actions: {
        async signIn(context) {
            context.commit("authWith", AuthState.loading)
            const auth = getAuth();
            onAuthStateChanged(auth, (user) => {
                if (user) {
                    context.commit("updateUserInfo", {userName: user.displayName})
                    context.commit("authWith", AuthState.signed)
                } else {
                    context.commit("updateUserInfo", {userName: stringResources.ANONYMOUS})
                    context.commit("authWith", AuthState.anonymous)
                }
            });
        },
        async authWithGoogle(context) {
            context.commit("authWith", AuthState.loading)
            const provider = new GoogleAuthProvider();
            const auth = getAuth();
            await signInWithPopup(auth, provider)
                .then((result) => {
                    const credential = GoogleAuthProvider.credentialFromResult(result);
                    if (credential !== null) {
                        return firebase.auth().signInWithCredential(credential);
                    }
                }).catch((error) => {
                });
            await context.dispatch("signIn")
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
    getters: {}
});

export {store, AuthState}