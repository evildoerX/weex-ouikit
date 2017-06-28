<template>
  <div class="mask" :class="[show?'active':'']" @click="click"
    :style="[{'justify-content':justify}]">
    <slot></slot>
  </div>
</template>
<script>
export default {
  name: 'OMask',
  props: {
    show: {
      type: Boolean,
      default: false
    },
    justify: {
      type: String,
      default: 'center'
    }
  },
  methods: {
    click () {
      this.$emit('click', false)
    }
  },
  created () {
    Vue.prototype.$uMask = this
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-mask/o-mask'
</style>
