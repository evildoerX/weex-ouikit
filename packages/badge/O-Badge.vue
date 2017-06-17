<template>
  <div class="badge-wrapper">
    <slot></slot>
    <text v-if="dot&&!count" class="dot"></text>
    <text v-if="count" class="count">{{count}}</text>
  </div>
</template>
<script>
export default {
  name: 'OBadge',
  // data () {
  //   return {
  //     num: ''
  //   }
  // },
  // created () {
  //   this.num = this.count
  //   this.updatecount()
  // },
  props: {
    dot: Boolean,
    count: [String, Number]
  }
  // methods: {
  //   updatecount () {
  //     if (this.num > 99) {
  //       this.num = '99+'
  //     }
  //   }
  // }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-badge/o-badge'
</style>
