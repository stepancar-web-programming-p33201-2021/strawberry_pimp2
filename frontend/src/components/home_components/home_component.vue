<template>
  <div class="homePageStyle">
    <n-page-header :subtitle="stringResources.HEADER_SUBTITLE">
      <n-grid :cols="5">
        <n-gi>
          <n-statistic label="Episodes" value="125"/>
        </n-gi>
        <n-gi>
          <n-statistic label="Guests" value="22"/>
        </n-gi>
        <n-gi>
          <n-statistic label="Apologies" value="36"/>
        </n-gi>
        <n-gi>
          <n-statistic label="Topics" value="83"/>
        </n-gi>
        <n-gi>
          <n-statistic label="Reference Links" value="2,346"/>
        </n-gi>
      </n-grid>
      <template #title>
        <a href="/" style="text-decoration: none; color: inherit;">
          StrawberryPimp
        </a>
      </template>
      <template #header>
        <n-breadcrumb>
          <n-breadcrumb-item>Podcast</n-breadcrumb-item>
          <n-breadcrumb-item>Best Collection</n-breadcrumb-item>
          <n-breadcrumb-item>Ultimate Best Collection</n-breadcrumb-item>
          <n-breadcrumb-item>Anyway.FM</n-breadcrumb-item>
        </n-breadcrumb>
      </template>
      <template #avatar>
        <n-avatar
            :src="requireImage(icons.MAIN_ICON)"
        />
      </template>
      <template #extra>
        <n-space>
          <user-button-component></user-button-component>
        </n-space>
      </template>
      <template #footer>{{ isAuthorized }}</template>
    </n-page-header>
  </div>

  <!--
   TODO:
    1. place here component with cards with the help of Vuex
    2. place here a little user tab in header
    3. place a little button to publish some info about user with the help of vuex
   -->
</template>

<script lang="ts">

import {defineComponent} from "vue";
import {
  NAvatar,
  NBreadcrumb,
  NBreadcrumbItem,
  NGi,
  NGrid,
  NPageHeader,
  NStatistic,
  useMessage
} from "naive-ui";
import {icons, requireImage, stringResources} from "@/utils/constants";
import {store} from "@/store/store";
import userButtonComponent from "./user_button_component.vue";


const HomeComponent = defineComponent({
  name: "home_component",
  components: {
    NPageHeader, NGrid, NGi, NBreadcrumb,
    NBreadcrumbItem,
    NStatistic, NAvatar,
    userButtonComponent
  },
  data() {
    return {
      icons,
      stringResources
    };
  },
  methods: {
    requireImage
  },
  computed: {
    isAuthorized() {
      return store.getters.isAuthorized;
    }
  },
  setup() {
    const message = useMessage()
    return {
      handleBack() {
        message.info('[onBack]')
      },
      options: [
        {
          label: 'More episodes',
          key: '1'
        },
        {
          label: 'More episodes',
          key: '2'
        },
        {
          label: 'More episodes',
          key: '3'
        }
      ]
    }
  }

});

export default HomeComponent;
</script>

<style scoped>
.homePageStyle {
  padding-left: 16px;
  padding-right: 16px;
}
</style>