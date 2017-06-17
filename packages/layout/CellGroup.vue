<template>
  <div class="cell-group">
    <div class="header">
      <text v-if="!$slots.left&&title" class="title">{{title}}</text>
      <slot name="left"></slot>
      <slot name="right"></slot>
    </div>
    <slot></slot>
  </div>
</template>
<script>
export default {
  name: 'u-cell-group',
  props: {
    title: String
  }
}
</script>
<style lang="sass" scoped>
.cell-group {
  background-color: #fff;
  border-bottom-color: #e5e5e5;
  border-bottom-style: solid;
  border-bottom-width: 1px;
}
.header {
  padding-top: 16px;
  padding-bottom: 16px;
  padding-left: 20px;
  padding-right: 20px;
  border-bottom-color: #e5e5e5;
  border-bottom-style: solid;
  border-bottom-width: 1px;
}
.title {
  color: #999999;
  font-size: 28px;
}
.text {
  color: #999999;
}
</style>
