<!-- 右侧icon相距20px -->
<template>
  <div class="o-navbar-content"
  :class="iOSstat"
  :style="{'background-color':bgcolor}">
    <div class="o-navbar-left">
      <text v-if="!$slots.left">&nbsp;</text>
      <slot name="left"></slot>
    </div>
    <text class="o-navbar-title">{{title}}</text>
    <div class="o-navbar-right ">
      <text v-if="!$slots.right">&nbsp;</text>
      <slot v-else name="right"></slot>
    </div>
  </div>
</template>
<script>
export default {
  name: 'ONavbar',
  props: {
    bgcolor: {
      type: String,
      default: '#35495e'
    },
    title: {
      default: ''
    }
  },
  computed: {
    iOSstat () {
      let type = WXEnvironment.platform
      console.log (type)
      return [
        type === 'iOS' ? `o-navbar-content-iOS` : `o-navbar-content-normal`,
      ]
    }
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-navbar/o-navbar.scss'
</style>
