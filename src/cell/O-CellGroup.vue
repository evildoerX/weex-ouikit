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
  name: 'OCellGroup',
  props: {
    title: String
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-cell/o-cellgroup.scss'
</style>
