<template>
  <div class="v-cells">
    <u-cell-group title="个人信息">
      <u-cell text="用户名" value="erguotou">
        <OIcon iconID="&#xe8ed;"></OIcon>
      </u-cell>
      <u-cell text="邮箱" value="erguotou525@gmail.com" show-arrow>
        <image slot="icon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII="></image>
      </u-cell>
      <u-cell text="性别" :value="gender==='male'?'男':'女'">
        <u-switch slot="right" :value="gender" size="small" @input="v=>gender=v"
          true-value="male" false-value="female"></u-switch>
      </u-cell>
    </u-cell-group>
     <u-cell-group title="个人信息">
      <OCell
        dataRole="none"
        :height="navBarHeight"
        leftItemTitle="我的账号"
        rightItemTitle="保护中"
        @OCellItemClick="OCellItemClick">
      </OCell>
      <OCell
        dataRole="none"
        :height="navBarHeight"
        leftItemTitle="余额"
        rightItemTitle="-1024"
        @OCellItemClick="OCellItemClick">
      </OCell>
      <OCell
        dataRole="none"
        :height="navBarHeight"
        leftItemTitle="提现"
        leftItemColor="#b2b2b2"
        @OCellItemClick="OCellItemClick">
      </OCell>
      <OCell
        dataRole="none"
        :height="navBarHeight"
        leftItemTitle="重要消息"
        leftItemColor="green"
        leftTip="1"
        @OCellItemClick="OCellItemClick">
      </OCell>
      <OCell
        dataRole="none"
        :height="navBarHeight"
        leftItemTitle="接收通知"
        @OCellItemClick="OCellItemClick">
      </OCell>
      <OCell
        dataRole="none"
        :height="navBarHeight"
        leftItemSrc="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII="
        leftItemTitle="通用"
        @OCellItemClick="OCellItemClick">
      </OCell>
      <OCell
        dataRole="none"
        :height="navBarHeight"
        leftItemSrc="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAMAAABgZ9sFAAAAVFBMVEXx8fHMzMzr6+vn5+fv7+/t7e3d3d2+vr7W1tbHx8eysrKdnZ3p6enk5OTR0dG7u7u3t7ejo6PY2Njh4eHf39/T09PExMSvr6+goKCqqqqnp6e4uLgcLY/OAAAAnklEQVRIx+3RSRLDIAxE0QYhAbGZPNu5/z0zrXHiqiz5W72FqhqtVuuXAl3iOV7iPV/iSsAqZa9BS7YOmMXnNNX4TWGxRMn3R6SxRNgy0bzXOW8EBO8SAClsPdB3psqlvG+Lw7ONXg/pTld52BjgSSkA3PV2OOemjIDcZQWgVvONw60q7sIpR38EnHPSMDQ4MjDjLPozhAkGrVbr/z0ANjAF4AcbXmYAAAAASUVORK5CYII="
        leftItemTitle="通用"
        rightItemDisc="有一个可用红包"
        rightItemDiscColor="red"
        @OCellItemClick="OCellItemClick">
      </OCell>
    </u-cell-group>
    <u-cell-group>
      <u-cell text="分享名片" show-arrow @click.native="share">
        <v-icon slot="icon" color="#489cff" size="30px">&#xe712;</v-icon>
      </u-cell>
    </u-cell-group>
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
    OCellItemClick: function (e) {
      this.$emit('OCellItemClick')
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
