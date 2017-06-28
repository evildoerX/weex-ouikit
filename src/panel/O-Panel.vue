<template>
  <div
    class="panel-container"
    @click="click"
    @longpress="longpress">
    <div class="panel-content"
    :class="panelcontentheight">
      <image
        v-if="Src"
        :src="Src"
        class="l-image"></image>
      <div class="text-content">
        <text
          v-if="Title"
          :style="{color:TitleColor}"
          class="titletext">{{Title}}</text>
        <text
          v-if="Disc"
          :class="disctext"> {{Disc}}</text>
        <div class="textfooter"
          v-if="!Src && footer">
          <text class="textfrom">{{textfrom}}</text>
          <text class="textother">{{otherinfo}}</text>
        </div>
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
    //背景色
    backgroundColor: { default: 'white' },
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
    Disabled: Boolean,
    footer: Boolean,
    textfrom: {
      default: ''
    },
    otherinfo: {
      default: ''
    }
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
    panelcontentheight () {
      return [
        !this.Src && this.footer? `panelcontent_heightA` : `panelcontent_height`,
      ]
    },
    disctext () {
      return [
        this.Src ? `disc-text` : `disc-textA`
      ]
    }
  }
}
</script>

<style scoped lang="sass">
  @import '../theme-default/widget/o-panel/o-panel.scss'
</style>
