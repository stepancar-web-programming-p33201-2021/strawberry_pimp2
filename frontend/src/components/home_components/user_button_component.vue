<template>
  <UserProfileComponent></UserProfileComponent>
  <n-button :disabled="isLoading()" :onclick="tryOpenUserProfile"
    >{{ contents() }}
  </n-button>
</template>

<script lang="ts">
import { NButton } from "naive-ui";
import { defineComponent } from "vue";
import { AuthState, store } from "@/store/store";
import { stringResources } from "@/utils/constants";
import initAuthDialogActivator from "@/components/user_dialog/user_auth_component.vue";
import UserProfileComponent from "@/components/user_dialog/user_profile_component.vue";

const userButtonComponent = defineComponent({
  name: "user_button_component",
  components: {
    NButton,
    UserProfileComponent,
  },
  data() {
    return {};
  },
  methods: {
    isLoading(): boolean {
      return store.state.authState == AuthState.loading;
    },
    contents(): string {
      return this.isLoading()
        ? stringResources.LOADING_KEYWORD
        : store.state.userName;
    },
    tryOpenUserProfile(): void {
      store.dispatch("tryOpenUserProfile");
    },
  },
  setup() {
    initAuthDialogActivator();
    return {};
  },
});

export default userButtonComponent;
</script>

<style scoped></style>
