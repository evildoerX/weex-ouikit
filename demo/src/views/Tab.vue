<template>
  <div class="otabs">
    <OTabs :value="tab1" @input="v=>tab1=v">
      <OTab label="已发货" value="one"><text>已发货...</text></OTab>
      <OTab label="未发货" value="two"><text>未发货...</text></OTab>
      <OTab label="全部订单" value="third"><text>全部订单...</text></OTab>
    </OTabs>
  </div>
</template>
<script>
export default {
  data () {
    return {
      tab1: 'one'
    }
  }
}
</script>
<style lang="sass" scoped>
.otabs {
  margin-top:20px;
}
.title {
  padding:20px;
}
</style>
