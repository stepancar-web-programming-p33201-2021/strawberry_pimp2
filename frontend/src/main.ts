import {createApp} from "vue";
import App from "./components/App.vue";
import {store} from "@/store/store";
import firebase from "firebase/compat";
import {firebaseConfig} from "@/utils/constants";
import naive from "naive-ui";
import {i18n} from "@/i18n";


firebase.initializeApp(firebaseConfig);
const app = createApp(App).use(i18n);
app.use(i18n);
app.use(naive);
app.use(store);
app.mount("#app");
