<template>
  <div class="loading">
    <image class="img" src="https://media.giphy.com/media/l0Iy9nEw0XgbPeT16/giphy.gif"></image>
    <text class="text"><slot></slot></text>
  </div>
</template>
<script>
export default {
  name: 'OLoading'
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-laoding/o-loaidng'
</style>
