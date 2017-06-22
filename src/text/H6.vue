<!-- 副标题,提示,次要信息 -->
<template>
  <text class="u-h6" :class="['color_' + color]"><slot></slot></text>
</template>
<script>
export default {
  name: 'OH6',
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
