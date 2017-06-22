<template>
  <div v-if="actived">
     <slot></slot>
  </div>
</template>
<script>
const modal = weex.requireModule('modal')
export default {
  name: 'OTab',
  props: {
    label: {
      type: String,
      required: true
    },
    value: {
      type: [String, Number, Boolean, Object, Array],
      required: true
    }
  },
  data () {
    return {
      $parent: null
    }
  },
  computed: {
    actived () {
      return this.$parent && this.$parent.value === this.value
    }
  },
  created () {
    let parent = this.$parent
    while (parent.$parent && parent.$options._componentTag !== 'OTabs') {
      parent = parent.$parent
    }
    if (parent.$options._componentTag !== 'OTabs') {
      modal.toast({ message: 'OTabs不能单独使用', duration: 0.3 })
      return
    }
    this.$parent = parent
    parent.addTab(this)
  },
  beforeDestroy () {
    this.$parent && this.$parent.removeTab(this)
  }
}
</script>
