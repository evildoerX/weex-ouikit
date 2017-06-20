<template>
  <div class="switch" :class="[checked?'checked':'', disabled?'disabled':'', 'sz-' + size]" @click="change">
    <div class="icon" :class="[checked?'icon-checked':'', disabled?'icon-disabled':'', 'isz-' + size]" ref="icon"></div>
    <text v-if="$slots.default" class="text" :class="[disabled?'text-disabled':'']"><slot></slot></text>
  </div>
</template>
<script>
const animation = weex.requireModule('animation')
export default {
  name: 'OSwitch',
  props: {
    value: [String, Number, Boolean, Object, Array],
    trueValue: {
      type: [String, Number, Boolean, Object, Array],
      default: true
    },
    falseValue: {
      type: [String, Number, Boolean, Object, Array],
      default: false
    },
    size: {
      // 'small', 'normal', 'large'
      type: String,
      default: 'normal'
    },
    disabled: {
      type: Boolean,
      default: false
    }
  },
  computed: {
    checked () {
      return this.value == this.trueValue
    }
  },
  methods: {
    change () {
      if (!this.disabled) {
        const targetValue = this.checked ? this.falseValue : this.trueValue
        console.log(targetValue)
        animation.transition(this.$refs.icon, {
          styles: {
            transform: `translateX(${this.checked ? '0' : '100%'})`
          },
          duration: 300, //ms
          timingFunction: 'ease',
          delay: 0 //ms
        })
        this.$emit('input', targetValue)
        this.$emit('change', targetValue)
      }
    }
  },
  mounted () {
    this.$nextTick(() => {
      if (this.checked) {
        animation.transition(this.$refs.icon, {
          styles: {
            transform: 'translateX(100%)'
          },
          duration: 0, //ms
          delay: 0 //ms
        })
      }
    })
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-switch/switch.scss'
</style>
