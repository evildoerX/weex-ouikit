<template>
  <div class="v-rates">
    <div class="cell">
      <ORater :value="rate1" @input="v=>rate1=v"></ORater>
    </div>
    <div class="cell">
      <ORater :max="10" :value="rate2" @input="v=>rate2=v"></ORater>
    </div>
  </div>
</template>
<script>
export default {
  data () {
    return {
      rate1: 0,
      rate2: 4.4
    }
  }
}
</script>
<style lang="stylus" scoped>
.v-rates
  padding 20px
.row
  flex-direction row
  margin-top 20px
  margin-bottom 20px
.cell
  flex 1
</style>
