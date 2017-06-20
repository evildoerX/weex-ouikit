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
<style lang="stylus" scoped>
@import "../theme-default/var.styl"
$switch-small-height = 40
$switch-normal-height = 60
$switch-large-height = 80
$switch-small-border = 2px
$switch-normal-border = 4px
$switch-large-border = 6px
.switch
  flex-direction row
  align-items center
  background-color #fff
  border-color #dfdfdf
  border-style solid
  border-width 2px

// size
.sz-small
  min-width ($switch-small-height * 2)px
  height ($switch-small-height)px
  border-radius ($switch-small-height / 2)px
.sz-normal
  min-width ($switch-normal-height * 2)px
  height ($switch-normal-height)px
  border-radius ($switch-normal-height / 2)px
.sz-large
  min-width ($switch-large-height * 2)px
  height ($switch-large-height)px
  border-radius ($switch-large-height / 2)px
.checked
  background-color #04be02
.disabled
  background-color $color-disabled
.icon
  background-color #fff
  border-style solid
  border-color #dfdfdf
  transform translateX(0)
.icon-checked
  border-color #04be02
.icon-disabled
  border-color $color-disabled
// circle size
.isz-small
  width ($switch-small-height)px
  height @width
  border-width $switch-small-border
  border-radius ($switch-small-height / 2)px
.isz-normal
  width ($switch-normal-height)px
  height @width
  border-width $switch-normal-border
  border-radius ($switch-normal-height / 2)px
.isz-large
  width ($switch-large-height)px
  height @width
  border-width 3px;
  border-radius ($switch-large-height / 2)px
.text
  color #fff
  margin-left 0px
.text-disabled
  color $color-text-disabled
</style>
