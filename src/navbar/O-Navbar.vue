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
.header {
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  padding-left: 36px;
  padding-right: 36px;
  padding-bottom:6px;
}
.header-normal {
  height: 92px;
  padding-top:6px;
}
.header-iOS {
  height: 132px;
  padding-top:46px;
}
.bg-primary {
  background-color: #35495e;
}
.left{
  flex-direction: row;
  flex: 1;
}
.right {
  flex-direction: row;
  justify-content: flex-end;
  flex: 1;
}
.title {
  flex: 3;
  color: #fff;
  font-size: 36px;
  font-weight: 400;
  text-align: center;
}
</style>
