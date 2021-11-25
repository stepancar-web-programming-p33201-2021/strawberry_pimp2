import {createStore} from "vuex";

interface Smth {
    count: 0,
    fToken: string,
}

const store = createStore({
    state() {
        return {} as Smth;
    },
    mutations: {
        increment(state: Smth) {
            state.count++
        }
    }
});

export {store}