<template>
  <div class="rate">
    <div v-for="n in max" class="rate-icon-wrapper">
      <OIcon class="rate-icon" :color="n <= value?'#ffd56c':'#ccc'" @click="select(n)" :iconID="n <= value? fullStar : emptyStar"></OIcon>
      <OIcon v-if="remWidth>0&&n>value&&n-1<value" class="rate-icon rate-icon-rem"
        color="#ffd56c" :style="{width:`${remWidth*0.36}px`}" @click="select(n)" :iconID="fullStar"></OIcon>
    </div>
  </div>
</template>
<script>
export default {
  name: 'ORater',
  props: {
    value: {
      type: Number,
      required: true
    },
    max: {
      type: Number,
      default: 5
    }
  },
  data () {
    return {
      emptyStar: '&#xe64c;',
      fullStar: '&#xe64b;'
    }
  },
  computed: {
    remWidth () {
      return this.value * 100 % 100
    }
  },
  methods: {
    select (index) {
      this.$emit('input', index)
    }
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-rater/rater'
</style>
