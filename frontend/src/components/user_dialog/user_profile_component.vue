<template>
  <n-modal :show="showModal">
    <n-card
      :title="title()"
      closable
      @close="close"
      size="small"
      :segmented="{
        content: 'hard',
        footer: 'soft',
      }"
    >
      <template #header-extra> #header-extra</template>
      Card Content
      <template #footer> Countdown {{ timeout / 1000 }}s</template>
      <template #action>
        <n-space>
          <n-button>Default</n-button>
          <n-button type="primary">Primary</n-button>
          <n-button type="info">Info</n-button>
          <n-button type="success">Success</n-button>
          <n-button type="warning">Warning</n-button>
          <n-button type="error">Error</n-button>
        </n-space>
      </template>
    </n-card>
  </n-modal>
</template>

<script lang="ts">
import { defineComponent, ref } from "vue";

import { waitTillActionAndComplete } from "@/utils/utils";
import { NModal } from "naive-ui";
import { store } from "@/store/store";

const UserProfileComponent = defineComponent({
  components: {
    NModal,
  },
  name: "user_profile_component",
  methods: {
    title() {
      return store.state.userName;
    },
  },
  setup() {
    const showModalRef = ref(false);
    const timeoutRef = ref(6000);

    // const countdown = () => {
    //   if (timeoutRef.value <= 0) {
    //     showModalRef.value = false
    //   } else {
    //     timeoutRef.value -= 1000
    //     setTimeout(countdown, 1000)
    //   }
    // }
    const close = () => {
      showModalRef.value = false;
    };

    const handleClick = () => {
      showModalRef.value = true;
      timeoutRef.value = 6000;

      // countdown()
    };
    waitTillActionAndComplete("openUserProfile", handleClick);

    return {
      showModal: showModalRef,
      timeout: timeoutRef,
      handleClick,
      close,
    };
  },
});

export default UserProfileComponent;
</script>

<style scoped>
.n-card {
  max-width: 45%;
}
</style>
