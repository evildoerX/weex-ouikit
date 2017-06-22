<template>
  <div class="cell-group">
    <div class="header">
      <text v-if="!$slots.left&&title" class="title">{{title}}</text>
      <slot name="left"></slot>
      <slot name="right"></slot>
    </div>
    <slot></slot>
    <div class="footer">
      <text v-if="footer" class="footer_text">{{footer}}</text>
      <text
          v-if="showArrow"
          class="arrow"></text>
      <slot name="left"></slot>
      <slot name="right"></slot>
    </div>
  </div>
</template>
<script>
export default {
  name: 'OPanelGroup',
  props: {
    title: String,
    footer: String,
    showArrow: Boolean
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-panel/o-panelgroup.scss'
</style>
