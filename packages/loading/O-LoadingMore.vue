<template>
  <div class="loading">
    <div v-if="!showloading" class="loadingline"></div>
    <image v-if="showloading" class="img" src="https://media.giphy.com/media/l0Iy9nEw0XgbPeT16/giphy.gif"></image>
    <text class="text" :style="{color:color,'background-color':backgroundcolor}" ><slot></slot></text>
  </div>
</template>
<script>
export default {
  name: 'OLoadingMore',
  props: {
    color: {
      default: 'black'
    },
    backgroundcolor: {
      default: ''
    },
    showloading: {
      type: Boolean,
      default: true
    }
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-laoding/o-loadingmore'
</style>
