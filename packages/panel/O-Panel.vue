<template>
  <div
    class="container"
    :class="cellstyle"
    :style="{ height: `${height}px`}"
    @click="click"
    @longpress="longpress">
    <div class="content">
      <div class="img-content">
        <image
          v-if="Src"
          :src="Src"
          class="left-image"></image>
      </div>
      <div class="text-content">
        <OH3
          v-if="Title"
          :style="{color:TitleColor}"
          :class="lefttext">{{Title}}</OH3>
          <OH6
          v-if="Disc"
          :style="{color:DiscColor}"
          :class="leftdisc">{{Disc}}</OH6>
      </div>
    </div>
  </div>
</template>

<script>
import OH3 from '../text/H3.vue'
import OH6 from '../text/H6.vue'
export default {
  name: 'OPanel',
  components: {
    OH3,
    OH6
  },
  data () {
    return {
    }
  },
  props: {
    //导航条背景色
    backgroundColor: { default: 'white' },
    //导航条高度
    height: { default: 87 },
    //左侧按钮图片
    Src: { default: '' },
    //左侧按钮标题
    Title: { default: '' },
    //左侧tips
    Disc: {default: '' },
    //左侧按钮颜色
    TitleColor: { default: 'black' },
    //右侧值
    value: { default: '' },
    //右侧值颜色
    valueColor: { default: '#999999' },
    showArrow: Boolean,
    Disabled: Boolean
  },
  methods: {
    click (e) {
      this.$emit('click', e)
    },
    longpress (e) {
      this.$emit('longpress', e)
    }
  },
  computed: {
    lefttext () {
      return [
        this.Src ? `left-textA` : `left-text`,
        this.Disabled ? `Disabled` : ``
      ]
    },
    left_disc () {
      return [
        this.showArrow ? `right-textA` : `right-text`,
        this.Disabled ? `Disabled` : ``
      ]
    },
    cellstyle () {
      return [
        this.Disabled ? `Disabled` : ``
      ]
    }
  }
}
</script>

<style scoped lang="sass">
  @import '../theme-default/widget/o-panel/o-panel.scss'
</style>
