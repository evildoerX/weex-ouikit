<template>
  <div class="input-field">
    <div v-if="$slots.left_text" class="left_text">
      <slot name="left_text"></slot>
    </div>
    <div v-if="$slots.left_icon" class="left_icon">
      <slot name="left_icon"></slot>
    </div>
    <input class="input" :class="[!!$slots.left_text ? 'with-left_text' : '',!!$slots.left_icon ? 'with-left_icon' : '', !!$slots.right ? 'with-right': '']"
      :type="type" :placeholder="placeholder" :value="inputVal"
      @input="handleInput"
      @change="e=>$emit('change', e)"
      @focus="e=>$emit('focus', e)"
      @blur="e=>$emit('blur', e)"
      @return="e=>$emit('return', e)"
      ref="input">
    </input>
    <div v-if="$slots.right" class="right">
      <slot name="right"></slot>
    </div>
  </div>
</template>
<script>
export default {
  name: 'OInput',
  props: {
    type: String,
    value: String,
    placeholder: String
  },
  data () {
    return {
      inputVal: this.value
    }
  },
  watch: {
    value (val) {
      this.inputVal = val
    }
  },
  methods: {
    handleInput (e) {
      this.$emit('input', e.value)
    },
    focus () {
      this.$refs.input.focus()
    },
    blur () {
      this.$refs.input.blur()
    }
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-input/o-input'
</style>
