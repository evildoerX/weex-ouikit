<template>
  <div class="oradios">
    <div class="radio-block">
      <OSwitch :value="checked3" @input="v=>checked3=v" size="small"
        true-value="male" false-value="female"></OSwitch>
      <OSwitch :value="checked4" @input="v=>checked4=v"
        true-value="male" false-value="female" style="margin-left:100px"></OSwitch>
    </div>
    <div class="radio-block">
      <OSwitch :value="checked5" @input="v=>checked5=v" size="large"
        true-value="male" false-value="female"></OSwitch>
      <OSwitch :value="checked6" @input="v=>checked6=v" disabled
        true-value="ok" false-value="no" style="margin-left:100px"></OSwitch>
    </div>
  </div>
</template>
<script>
export default {
  data () {
    return {
      checked3: 'male',
      checked4: 'female',
      checked5: 'male',
      checked6: 'ok'
    }
  }
}
</script>
<style lang="stylus" scoped>
.oradios
  padding 20px
.radio-block
  flex-direction row
  margin-top 20px
  margin-bottom 20px
.radio-item
  flex 1
</style>
