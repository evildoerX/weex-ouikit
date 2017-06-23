<template>
  <div class="timeline-item">
    <text class="dot" :class="[isFirst?'dot-active':'']"></text>
    <div class="line-top" :class="[isFirst?'line-top-first':(index===1?'line-top-second':'')]"></div>
    <div class="line-bottom" :class="[isLast?'line-bottom-last':(isFirst?'line-bottom-first':'')]"></div>
    <div class="content">
      <text class="title" :class="[isFirst?'title-active':'']"><slot></slot></text>
      <slot v-if="!isFirst" name="extra"></slot>
      <slot v-else name="extra-active"></slot>
      <text class="date" :class="[isFirst?'date-active':'']">{{date}}</text>
    </div>
  </div>
</template>
<script>
const modal = weex.requireModule('modal')
export default {
  name: 'v-timeline-item',
  props: {
    date: {
      type: String,
      required: true
    }
  },
  data () {
    return {
      index: -1,
      $parent: null
    }
  },
  computed: {
    isFirst () {
      return this.index === 0
    },
    isLast () {
      return this.$parent && this.$parent.childrenCount === this.index + 1
    }
  },
  created () {
    let parent = this.$parent
    while (parent.$parent && parent.$options._componentTag !== 'v-timeline') {
      parent = parent.$parent
    }
    if (parent.$options._componentTag !== 'v-timeline') {
      modal.toast({ message: 'v-timeline-item不能单独使用', duration: 0.3 })
      return
    } else {
      this.index = parent.addLine()
    }
    this.$parent = parent
  }
}
</script>
<style lang="sass" scoped>

</style>
