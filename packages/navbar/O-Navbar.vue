<!-- 右侧icon相距20px -->
<template>
  <div class="header" :class="['bg-' + type]" :style="bg?{'background-color':bg}:{}">
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
  }
}
</script>
<style lang="sass" scoped>
.header {
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  height: 92px;
  padding-left: 36px;
  padding-right: 36px;
  padding-top:6px;
  padding-bottom:6px;
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
