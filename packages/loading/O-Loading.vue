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
.loading {
  background-color: #535353;
  width: 250px;
  height: 250px;
  align-items: center;
  justify-content: center;
  border-radius: 20px;
}
.img {
  width: 76px;
  height: 76px;
}
.text {
  margin-top: 20px;
  color: #fcfcfc;
  text-align: center;
  font-size: 32px;
}
</style>
