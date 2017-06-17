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
.loading {
  align-items: center;
  flex-direction:row;
  justify-content: center;
}
.loadingline {
  position: absolute;
  width: 486px;
  height: 1px;
  background-color: #E5E5E5;
}
.img {
  width: 40px;
  height: 40px;
}
.text {
  line-height: 40px;
  font-size: 28px;
  padding-left:10px;
  padding-right:10px;
}
</style>
