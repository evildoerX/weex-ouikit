<template>
  <div class="input-number" :class="[disabled?'input-number-disabled':'']">
    <text class="minus" :class="[minusDisabled?'minus-disabled':'']" @click="minus">-</text>
    <input v-if="!disabled" type="tel" class="input" :class="[disabled?'input-disabled':'']" :value="value" @input="onInput"></input>
    <text v-else class="input" :class="[disabled?'input-disabled':'']">{{value}}</text>
    <text class="plus" :class="[plusDisabled?'plus-disabled':'']" @click="plus">+</text>
  </div>
</template>
<script>
export default {
  name: 'OInputNumber',
  props: {
    value: {
      type: Number,
      required: true
    },
    min: Number,
    max: Number,
    disabled: Boolean
  },
  computed: {
    minusDisabled () {
      return this.disabled || (this.min !== undefined && this.value <= this.min)
    },
    plusDisabled () {
      return this.disabled || (this.max !== undefined && this.value >= this.max)
    }
  },
  methods: {
    minus () {
      if (this.min === undefined || this.value > this.min) {
        this.$emit('input', -1 + this.value)
      }
    },
    plus () {
      if (this.max === undefined || this.value < this.max) {
        this.$emit('input', 1 + this.value)
      }
    },
    onInput (e) {
      if ((this.min === undefined || e.value > this.min) || (this.max === undefined || e.value < this.max)) {
        this.$emit('input', +e.value)
      }
    }
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-inputnumber/o-inputnumber'
</style>
