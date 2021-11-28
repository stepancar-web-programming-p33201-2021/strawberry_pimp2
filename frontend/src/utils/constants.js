const icons = {
    MAIN_ICON: "icons/food-strawberry.svg"
};
const stringResources = {
    APP_NAME: "StrawberryPimp",
    HEADER_SUBTITLE: "A podcast tmprove designs",
    ANONYMOUS: "Anonymous",
    LOADING_KEYWORD: "Loading",
};
const firebaseConfig = {
    apiKey: "AIzaSyCLUDhsK2QEHBJn4PHA2uPOTpyBSlwZm8Q",
    authDomain: "strawberrypimp.firebaseapp.com",
    projectId: "strawberrypimp",
    storageBucket: "strawberrypimp.appspot.com",
    messagingSenderId: "619449120359",
    appId: "1:619449120359:web:0ccf1cb52b770edb1a06c2",
    measurementId: "G-YTTPM2SFG7"
};
export const requireImage = (link) => {
    return require(`@/assets/${link}`);
};
export { icons, stringResources, firebaseConfig };
//# sourceMappingURL=constants.js.map