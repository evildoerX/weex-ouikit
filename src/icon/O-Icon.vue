<template>
  <text :style="style" @click="click" @longpress="longpress">{{getFontName}}</text>
</template>
<script>
const domModule = weex.requireModule('dom')
var he = require('he');
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
    },
    iconID: {
      default: '&#xe64d'
    }
  },
  computed: {
    style () {
      return {
        fontFamily: 'iconfont',
        color: this.color,
        fontSize: `${this.size}px`
      }
    },
    getFontName: function() {
      return he.decode(this.iconID)
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
  created () {
    domModule.addRule('fontFace', {
      'fontFamily': 'iconfont',
      'src': "url('http://at.alicdn.com/t/font_rlhwh5t0rj5uerk9.ttf')"
    })
  }
}
</script>
