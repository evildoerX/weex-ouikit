<template>
  <div class="radio" :class="c_radio" @click="change">
    <div class="radiocontent">
      <div class="icon" :class="c_iconbg">
        <div :class="c_icon"></div>
      </div>
      <text v-if="$slots.default" class="text" :class="[disabled?'text-disabled':'']"><slot></slot></text>
    </div>
  </div>
</template>
<script>
export default {
  name: 'o-radio',
  props: {
    value: [String, Number, Boolean, Object, Array],
    val: [String, Number, Boolean, Object, Array],
    disabled: {
      type: Boolean,
      default: false
    }
  },
  computed: {
    c_iconbg () {
      const result = []
      const checked = this.val === this.value
      console.log(checked, this.val)
      if (checked) {
        result.push('checked')
      }
      if (this.disabled) {
        result.push('disabled')
      }
      return result
    },
    c_icon (){
      const result = []
      const checked = this.val === this.value
      if (checked) {
        result.push('checkicon')
      }
      return result
    },
    c_radio (){
      const result = []
      if (this.disabled) {
        result.push('radio_disabled')
      }
      return result
    }
  },
  methods: {
    change () {
      if (!this.disabled) {
        this.$emit('input', this.val)
        this.$emit('change', this.val)
      }
    }
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-radio/o-radio.scss'
</style>
