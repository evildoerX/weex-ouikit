<template>
  <div class="select">
    <div class="item" :class="[disabled?'disabled':'']" @click="toggle">
      <text class="text" :class="[!text?'placeholder':'',disabled?'text-disabled':'']">{{text?text:placeholder}}</text>
      <text v-if="!disabled" class="icon"></text>
    </div>
  </div>
</template>
<script>
export default {
  name: 'u-select',
  props: {
    placeholder: String,
    value: [String, Number, Boolean, Object, Array],
    data: {
      type: Array,
      required: true
    },
    disabled: {
      type: Boolean,
      default: false
    },
    renderFn: Function
  },
  data () {
    return {
      expanded: false
    }
  },
  computed: {
    text () {
      if (this.value) {
        for (const opt of this.data) {
          if (opt.value === this.value) {
            return opt.label
          }
        }
      }
      return ''
    }
  },
  methods: {
    toggle () {
      if (!this.disabled) {
        this.expanded = !this.expanded
        if (this.expanded) {
          this.$emit('expand')
          this.$uSelectPopup.showPopup(this)
        }
      }
    },
    collapse () {
      this.expanded = false
    }
  },
  created () {
    this.$on('selected', opt => {
      this.$emit('input', opt.value)
    })
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-select/o-select'
</style>
