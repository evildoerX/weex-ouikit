<template>
  <div class="oradios">
    <div class="radio-block">
      <OSwitch :value="checked5" @input="v=>checked5=v" size="normal"
        true-value="true" false-value="false"></OSwitch>
    </div>
  </div>
</template>
<script>
export default {
  data () {
    return {
      checked5: 'true'
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
