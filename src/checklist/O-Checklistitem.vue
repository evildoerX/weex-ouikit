<template>
  <div class="checkbox" :class="o_checkbox" @click="change">
    <div class="checkbox-content">
      <text
        class="box"
        :class="boxconten"></text>
      <text
        v-if="checked"
        class="iconbg"
        :style="iconbgColor"
        :class="iconbgconten"></text>
      <text
        v-if="checked"
        class="icon"
        :class="iconconten"></text>
      <text
        v-if="$slots.default"
        class="text"
        :class="textcontent">
          <slot></slot>
        </text>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    value: [Array],
    val: [String, Number, Boolean, Object, Array],
    disabled: {
      type: Boolean,
      default: false
    },
    right: Boolean,
    color: {
      default: '#09bb07'
    }
  },
  computed: {
    checked () {
      return this.value.indexOf(this.val) > -1
    },
    boxconten () {
      return [
        this.right ? 'box_right': 'box',
        this.disabled ? 'box_disabled' : ''
      ]
    },
    iconconten () {
      return [
        this.right ? 'icon_right': 'icon_left',
        this.disabled ? 'icon_disabled' : ''
      ]
    },
    iconbgconten () {
      return [
        this.right ? 'iconbg_right': 'iconbg_left',
        this.disabled ? 'iconbg_disabled' : ''
      ]
    },
    iconbgColor () {
      return  this.disabled ? '' : {'background-color':this.color}
    },
    textcontent () {
      return [
        this.right ? '': 'text_left',
        this.disabled ? 'text_disabled' : ''
      ]
    },
    o_checkbox (){
      const result = []
      if (this.disabled) {
        result.push('checkbox_disabled')
      }
      return result
    }
  },
  methods: {
    change () {
      if (!this.disabled) {
        const copyed = this.value
        if (this.checked) {
          copyed.splice(this.value.indexOf(this.val), 1)
        } else {
          copyed.push(this.val)
        }
        console.log(copyed)
        this.$emit('input', copyed)
        this.$emit('change', copyed)
      }
    }
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-checklist/o-checklist.scss'
</style>
