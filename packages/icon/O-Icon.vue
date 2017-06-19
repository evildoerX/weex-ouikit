<template>
  <text :style="style" ><slot></slot></text>
</template>
<script>
const domModule = weex.requireModule('dom')
export default {
  name: 'OIcon',
  props: {
    size: {
      type: String,
      default: '34px'
    },
    color: {
      type: String,
      default: '#667180'
    }
  },
  computed: {
    style () {
      return {
        fontFamily: 'iconfont',
        color: this.color,
        fontSize: `${this.size}px`
      }
    }
  },
  // methods: {
  //   click (e) {
  //     this.$emit('click', e)
  //   },
  //   longpress (e) {
  //     this.$emit('longpress', e)
  //   }
  // },
  created () {
    domModule.addRule('fontFace', {
      'fontFamily': 'iconfont',
      'src': "url('//at.alicdn.com/t/font_dwy1kk58zpusdcxr.ttf')"
    })
  }
}
</script>
