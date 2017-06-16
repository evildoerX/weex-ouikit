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
  module.exports = {
    props: {
      color: {
        default: 'red'
      },
      size: {
        default: '150'
      },
      iconID: {
        default: '&#xe64d'
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
        'src': "url('http://at.alicdn.com/t/font_jm24n5nmz9i19k9.ttf')"
      });
    }
  }
</script>