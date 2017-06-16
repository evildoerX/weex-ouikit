<!-- weex 0.10不支持costom-component上使用v-model -->
<template>
  <OChecklist :checkItems="checkItems" :value="checked1" ></OChecklist>
</template>
<script>
export default {
  data () {
    return {
      checked1: ['c2', 'c3'],
      checkItems: [
        {
          title: 'tab1',
          val: 'c1'
        },
        {
          title: 'tab2',
          val: 'c2'
        },
        {
          title: 'tab3',
          val: 'c3',
          disabled: true
        },
        {
          title: 'tab4',
          val: 'c4',
          disabled: true
        }
      ]
    }
  }
}
</script>
<style scoped>

</style>
