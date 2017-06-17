<template>
  <div class="v-input-number">
    <div class="number-row">
      <div class="number-cell">
        <OInputNumber :value="number1" @input="v=>number1=v"></OInputNumber>
      </div>
      <div class="number-cell">
        <OInputNumber :value="number2" :min="0" :max="20" @input="v=>number2=v"></OInputNumber>
      </div>
    </div>
    <div class="number-row">
      <div class="number-cell">
        <OInputNumber :value="number3" disabled></OInputNumber>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data () {
    return {
      number1: 1,
      number2: 1,
      number3: 10
    }
  }
}
</script>
<style lang="stylus" scoped>
.v-input-number
  padding 20px
.number-row
  flex-direction row
  margin-top 20px
  margin-bottom 20px
.number-cell
  flex 1
</style>
