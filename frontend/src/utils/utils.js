import { store } from "@/store/store";
const waitTillActionAndComplete = function (actionType, func, once = false) {
    const unsubscribe = store.subscribeAction((action) => {
        if (action.type === actionType) {
            func();
            if (once) {
                unsubscribe();
            }
            else {
                ///TODO unsub when components rendered again?
            }
        }
    });
};
export { waitTillActionAndComplete };
//# sourceMappingURL=utils.js.map