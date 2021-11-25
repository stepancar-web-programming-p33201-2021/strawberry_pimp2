const icons = {
    MAIN_ICON: "icons/food-strawberry.svg"
}
const stringResources = {
    APP_NAME: "StrawberryPimp",
    HEADER_SUBTITLE: "A podcast to improve designs"
}
export const requireImage = (link: string) => {
    return require(`@/assets/${link}`);
}
export {icons, stringResources};