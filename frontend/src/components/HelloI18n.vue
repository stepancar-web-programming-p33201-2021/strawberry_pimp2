<template>
  <p>{{ $t('message') }}</p>
</template>

<script lang="ts">
import {defineComponent} from "vue";

const HelloI18N = defineComponent({
  name: "HelloI18n",
  setup() {
    // const {t} = useI18n({
    //   inheritLocale: true,
    //   useScope: "local",
    // });

    // Something todo ..

    // return {t};
  },
});
export default HelloI18N
</script>

<i18n>
{
  "en": {
    "hello": "Hello i18n in SFC!"
  }
}
</i18n>
