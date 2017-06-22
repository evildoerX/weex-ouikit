<template>
  <div class="v-cells">
     <OCellGroup title="个人信息">
      <OCell
        dataRole="none"
        :height="navBarHeight"
        Title="我的账号"
        value="保护中..."
        @Click="Click">
      </OCell>
    </OCellGroup>
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
      navBarHeight: 87
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
