<template>
  <div class="homeCardStyle">
    <n-card title="Card with Cover" hoverable>
      <template #cover>
        <n-carousel autoplay>
          <img
            class="carousel-img"
            src="https://naive-ui.oss-cn-beijing.aliyuncs.com/carousel-img/carousel1.jpeg"
          />
          <img
            class="carousel-img"
            src="https://naive-ui.oss-cn-beijing.aliyuncs.com/carousel-img/carousel2.jpeg"
          />
          <img
            class="carousel-img"
            src="https://naive-ui.oss-cn-beijing.aliyuncs.com/carousel-img/carousel3.jpeg"
          />
          <img
            class="carousel-img"
            src="https://naive-ui.oss-cn-beijing.aliyuncs.com/carousel-img/carousel4.jpeg"
          />
        </n-carousel>
      </template>
      Card Content
      <n-gradient-text type="info"> Live Forever </n-gradient-text>
      <n-gradient-text type="danger"> Live Forever </n-gradient-text>
      <br />
      <n-gradient-text :size="24" type="warning">
        Married with Children
      </n-gradient-text>
      <n-button type="primary">Primary</n-button>
    </n-card>
  </div>
  <!--
   TODO:
   1. button write to this man
   2. carousel with images of smth
   3. some special info that could be shown only after authorization/if not authoirized we can show, but encrypted
   -->
</template>

<style>
.homeCardStyle {
  /*noinspection CssInvalidFunction*/
  width: v-bind("vwidth()");
  padding: 16px;
}

.carousel-img {
  width: 100%;
  height: 240px;
  object-fit: cover;
}
</style>

<script lang="ts">
import { defineComponent } from "vue";
import { NButton, NCarousel, NGradientText, NCard } from "naive-ui";

const kWidth = 0.3;
const kHeight = 0.3;

interface HomeCardStyle {
  width: number | undefined;
  height: number | undefined;
}

const homeCardMixin = defineComponent({
  data() {
    return {
      homeCardStyle: { width: 0, height: 0 } as HomeCardStyle,
    };
  },
  methods: {
    onResize(): void {
      this.calculateWidth();
      this.calculateHeight();
    },
    calculateWidth(): number {
      this.homeCardStyle.width = window.innerWidth * kWidth;
      return this.homeCardStyle.width;
    },
    calculateHeight(): number {
      this.homeCardStyle.height = window.innerHeight * kHeight;
      return this.homeCardStyle.height;
    },
    vwidth(): string {
      return (this.homeCardStyle.width as number) + "px";
    },
  },
  created() {
    window.addEventListener("resize", this.onResize);
    this.onResize();
  },
  unmounted() {
    window.removeEventListener("resize", this.onResize);
  },
});

export default defineComponent({
  name: "home_card",
  mixins: [homeCardMixin],
  components: {
    NButton,
    NCarousel,
    NCard,
    NGradientText,
  },
  data() {
    return {
      carousels: [
        { contents: "Slide 1", color: "primary" },
        { contents: "Slide 2", color: "info" },
        { contents: "Slide 3", color: "success" },
        { contents: "Slide 4", color: "warning" },
        { contents: "Slide 5", color: "danger" },
      ],
    };
  },
  props: {
    ///TODO replace with simpler model from backend
    images: { type: Array, default: () => ["/img/logo.82b9c7a5.png"] },
    price: { type: Number }, ///in$ with cents
    realFullName: { type: String },
    nickname: { type: String },
    description: { type: String },
    totalWorkTime: { type: String },
  },
});
</script>
