<!-- 右侧icon相距20px -->
<template>
  <div class="header" :class="iOSstat" :style="bg?{'background-color':bg}:{}">
    <div class="left">
      <text v-if="!$slots.left">&nbsp;</text>
      <slot name="left"></slot>
    </div>
    <text class="title">{{title}}</text>
    <div class="right">
      <text v-if="!$slots.right">&nbsp;</text>
      <slot v-else name="right"></slot>
    </div>
  </div>
</template>
<script>
export default {
  name: 'ONavbar',
  props: {
    type: {
      type: String,
      default: 'primary'
    },
    bg: String,
    title: {
      default: ''
    }
  },
  computed: {
    iOSstat () {
      let type = WXEnvironment.platform
      console.log (type)
      return [
        type === 'iOS' ? `header-iOS` : `header-normal`,
      ]
    }
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-navbar/o-navbar.scss'
</style>
