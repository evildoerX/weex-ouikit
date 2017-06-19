<!-- 注释,tab,次要信息 -->
<template>
  <text class="u-h7" :class="['color_' + color]"><slot></slot></text>
</template>
<script>
export default {
  name: 'OH7',
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
