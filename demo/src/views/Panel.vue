<template>
  <div class="v-cells">
     <OPanelGroup title="图文组合列表" footer="查看更多" showArrow>
      <OPanel
        dataRole="none"
        :height="navBarHeight"
        Src="https://ss1.baidu.com/70cFfyinKgQFm2e88IuM_a/forum/pic/item/03087bf40ad162d9e2a45c7f1bdfa9ec8a13cd0e.jpg"
        Title="我是美女讲师"
        Disc="今天讲的课是xxx"
        @Click="Click">
      </OPanel>
      <OPanel
        dataRole="none"
        :height="navBarHeight"
        Src="https://ss1.baidu.com/70cFfyinKgQFm2e88IuM_a/forum/pic/item/03087bf40ad162d9e2a45c7f1bdfa9ec8a13cd0e.jpg"
        Title="我是美女讲师"
        Disc="今天讲的课是xxx"
        @Click="Click">
      </OPanel>
      <OPanel
        dataRole="none"
        :height="navBarHeight"
        Src="https://ss1.baidu.com/70cFfyinKgQFm2e88IuM_a/forum/pic/item/03087bf40ad162d9e2a45c7f1bdfa9ec8a13cd0e.jpg"
        Title="我是美女讲师"
        Disc="今天讲的课是xxx"
        @Click="Click">
      </OPanel>
      <OPanel
        dataRole="none"
        :height="navBarHeight"
        Src="https://ss1.baidu.com/70cFfyinKgQFm2e88IuM_a/forum/pic/item/03087bf40ad162d9e2a45c7f1bdfa9ec8a13cd0e.jpg"
        Title="我是美女讲师"
        Disc="今天讲的课是xxx"
        @Click="Click">
      </OPanel>
    </OPanelGroup>
  </div>
</template>
<script>
const clipboard = weex.requireModule('clipboard')
const modal = weex.requireModule('modal')
const domModule = weex.requireModule('dom')
export default {
  data () {
    return {
      gender: 'male',
      navBarHeight: 180
    }
  },
  methods: {
    share () {
      clipboard.setString('erguotou525@gmail.com')
      modal.toast({ message: '已复制邮箱地址', duration: 0.3 })
    },
    Click: function (e) {
      this.$emit('Click', e)
    }
  },
  created () {
    domModule.addRule('fontFace', {
      'fontFamily': 'iconfont',
      'src': "url('//at.alicdn.com/t/font_0dgio1v15kz6ko6r.ttf')"
    })
  }
}
</script>
