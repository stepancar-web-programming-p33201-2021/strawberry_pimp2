<template>
  <n-dialog-provider>
    <n-message-provider>
      <HomeComponent></HomeComponent>
    </n-message-provider>
  </n-dialog-provider>
</template>

<script lang="ts">
import {defineComponent} from "vue";
import HomeComponent from "./home_components/home_component.vue";
import {NMessageProvider} from "naive-ui";
import {useStore} from "vuex";

export default defineComponent({
  name: "App",
  components: {
    HomeComponent,
    NMessageProvider,
  },
  setup() {
    const store = useStore()
    store.dispatch("signIn")
  }
});
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 16px;
}
</style>
