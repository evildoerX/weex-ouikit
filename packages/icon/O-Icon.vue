<template>
  <text
  :style="{color:color,'font-size':size + `px`}"
    class="title2">{{getFontName}}</text>
</template>
<style>
  .title2 {
    font-family: iconfont;
  }
</style>

<script>
  var he = require('he');
  export default {

    name: 'OIcon',

    props: {
      color: {
        default: 'rgb(102, 113, 128)'
      },
      size: {
        default: '35'
      },
      iconID: {
        default: '&#xe668'
      }
    },
    computed: {
      getFontName: function() {
        return he.decode(this.iconID)
      }
    },
    created: function() {

      var domModule = weex.requireModule('dom');
      //目前支持ttf、woff文件，不支持svg、eot类型,moreItem at http://www.iconfont.cn/

      domModule.addRule('fontFace', {
        'fontFamily': "iconfont",
        'src': "url('http://at.alicdn.com/t/font_735pqo0vw87zxgvi.ttf')"
      });
    }
  }
</script>
