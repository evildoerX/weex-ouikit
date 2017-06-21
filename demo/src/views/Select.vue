<template>
  <div class="v-selects">
    <u-select :value="select1" @input="v=>select1=v" @expand="$store.dispatch('toggleSelect', true)"
      ref="select1" placeholder="请选择" class="select-item" :data="data1"></u-select>
    <u-select :value="select2" @input="v=>select2=v" @expand="$store.dispatch('toggleSelect', true)"
      ref="select2" placeholder="请选择" class="select-item" :data="data2"></u-select>
    <u-select placeholder="请选择" disabled class="select-item" :data="data1"></u-select>
    <OMask :show="$store.getters.maskVisiable" @click="onMaskClick">
      <u-select-popup :mask-show="$store.getters.maskVisiable" @hide-mask="$store.dispatch('toggleMask', false)"></u-select-popup>
    </OMask>
  </div>
</template>
<script>
export default {
  data () {
    return {
      select1: '',
      select2: 'female',
      data1: [{
        label: '男', value: 'male'
      }, {
        label: '女', value: 'female'
      }, {
        label: '其它', value: 'other'
      }],
      data2: [{
        label: '男', value: 'male'
      }, {
        label: '女', value: 'female'
      }, {
        label: '其它', value: 'other', disabled: true
      }]
    }
  },
  methods: {
    onMaskClick () {
      if (!this.$store.getters.loadingVisiable) {
        this.$store.dispatch('toggleMask', false)
      }
    }
  }
}
</script>
<style lang="stylus" scoped>
.v-selects
  padding 20px
.select-item
  margin-top 20px
  margin-bottom 20px
</style>
