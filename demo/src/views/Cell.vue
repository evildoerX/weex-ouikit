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
      <OCell
        dataRole="none"
        :height="navBarHeight"
        Title="余额"
        value="-1024"
        showArrow
        @Click="Click">
      </OCell>
      <OCell
        dataRole="none"
        :height="navBarHeight"
        Title="提现"
        showArrow
        Disabled
        @Click="Click">
      </OCell>
      <OCell
        dataRole="none"
        :height="navBarHeight"
        Title="重要消息"
        TitleColor="green"
        Tip="1"
        showArrow
        @Click="Click">
      </OCell>
      <OCell
        dataRole="none"
        :height="navBarHeight"
        Title="接收通知"
        @Click="Click">
      </OCell>
      <OCell
        dataRole="none"
        :height="navBarHeight"
        Src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII="
        Title="通用"
        showArrow
        @Click="Click">
      </OCell>
      <OCell
        dataRole="none"
        :height="navBarHeight"
        Src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII="
        Title="通用"
        value="有一个可用红包"
        valueColor="red"
        showArrow
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
