<template>
  <div :class="homeCardStyle">test</div>
</template>

<script lang="ts">
import {defineComponent} from "vue";

const kWidth = 0.3;
const kHeight = 0.3;

class HomeCardStyle {
  private _vwidth: number = 0;
  private _vheight: number = 0;

  get width(): string {
    return this._vwidth + 'px';
  }

  set vwidth(input: number | string) {
    if (typeof input === typeof 0) {
      this._vwidth = input as number;
    }
  }

  set vheight(input: number | string) {
    if (typeof input === typeof 0) {
      this._vheight = input as number;
    }
  }

  get height(): string {
    return this._vheight + 'px';
  }

  constructor(width: number, height: number) {
    this.vwidth = width;
    this.vheight = height;
  }

}


const homeCardMixin = defineComponent({
  data: function () {
    let homeCardStyle = new HomeCardStyle(this.calculateWidth(), this.calculateHeight());
    return {
      homeCardStyle,
    };
  },
  methods: {
    onResize(): void {
      this.calculateWidth();
      this.calculateHeight();
    },
    calculateWidth(): number {
      this.homeCardStyle.vwidth = window.innerWidth * kWidth;
      console.log(this.homeCardStyle.vwidth);
      return this.homeCardStyle.vwidth;
    },
    calculateHeight(): number {
      this.homeCardStyle.vheight = window.innerHeight * kHeight;
      return this.homeCardStyle.vheight;
    },
  },
  created() {
    window.addEventListener("resize", this.onResize);
  },
  unmounted() {
    window.removeEventListener("resize", this.onResize);
  },
});

export default defineComponent({
  name: "home_card",
  mixins: [homeCardMixin],
});
</script>

<style scoped></style>
