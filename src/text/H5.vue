<!-- 标题 -->
<template>
  <text class="u-h5" :class="['color_' + color]"><slot></slot></text>
</template>
<script>
export default {
  name: 'OH5',
  props: {
    color: {
      type: String,
      default: 'Gray'
    }
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-text/o-text.scss'
</style>
