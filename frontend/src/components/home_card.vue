<template>
  <div class="homeCardStyle">test</div>
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
}
</style>

<script lang="ts">
import {defineComponent} from "vue";


const kWidth = 0.3;
const kHeight = 0.3;

interface HomeCardStyle {
  width: number | undefined;
  height: number | undefined;
}

const homeCardMixin = defineComponent({
  data() {
    return {
      homeCardStyle: {width: 0, height: 0} as HomeCardStyle,
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
      return this.homeCardStyle.width as number + 'px';
    }
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
  props: {
    ///TODO replace with simpler model from backend
    images: {type: Array, default: () => ['/img/logo.82b9c7a5.png']},
    price: {type: Number},///in$ with cents
    realFullName: {type: String},
    nickname: {type: String},
    description: {type: String},
    totalWorkTime: {type:String}
  }
});
</script>

