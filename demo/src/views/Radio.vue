<template>
  <ORadio :radioItems="checkItems" :defaultkey="checked1" ></ORadio>
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
