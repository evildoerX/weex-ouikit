<template>
  <div
    class="container"
    :class="cellstyle"
    :style="{ height: `${height}px`}"
    @click="click"
    @longpress="longpress">
    <div class="content">
      <div class="left-content">
        <image
          v-if="Src"
          :src="Src"
          class="left-image"></image>
        <text
          v-if="Title"
          :style="{color:TitleColor}"
          :class="lefttext">{{Title}}</text>
        <text
          v-if="Tip"
          class="left-tip">{{Tip}}</text>
      </div>
      <text
          v-if="value"
          :style="{color:valueColor}"
          class="text"
          :class="valuetext">{{value}}</text>
        <text
          v-if="showArrow"
          class="arrow"></text>
    </div>
  </div>
</template>

<script>
import OIcon from '../icon/O-Icon'
export default {
  name: 'OCell',
  components: {
    OIcon
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
    Tip: {default: '' },
    //左侧按钮颜色
    TitleColor: { default: '' },
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
    valuetext () {
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
  @import '../theme-default/widget/o-cell/o-cell.scss'
</style>
