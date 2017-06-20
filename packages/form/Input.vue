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
.input-field {
  position: relative;
  justify-content: center;
  padding-left: 30px;
  background-color: #fff;
}
.left_text {
  position: absolute;
  left: 30;
  top: 0;
  width: 140px;
  height: 88px;
  align-items: center;
  justify-content: center;
  border-bottom-color: black;
  border-bottom-width: 1px;
  border-bottom-style: solid;
}
.left_icon {
  position: absolute;
  left: 30;
  top: 0;
  width: 88px;
  height: 88px;
  align-items: center;
  justify-content: center;
  border-bottom-color: black;
  border-bottom-width: 1px;
  border-bottom-style: solid;
}
.right {
  position: absolute;
  right: 0;
  top: 0;
  width: 226px;
  height: 88px;
  align-items: center;
  justify-content: center;
}
.input {
  height: 88px;
  font-size: 34px;
  border-color: white;
  border-width: 1px;
  border-style: solid;
  border-bottom-color: #E5E5E5;
  border-bottom-width: 1px;
  border-bottom-style: solid;
}
.with-left_text {
  padding-left: 180px;
}
.with-left_icon {
  padding-left: 90px;
}
.with-right {
  padding-right: 88px;
}
</style>
