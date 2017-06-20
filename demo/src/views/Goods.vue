<template>
  <div class="v-homepage grid">
    <OH3 class="title" >店铺组件</OH3>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/input')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">店铺list</text></div>
      <div class="grid-cell" @click="jump('/select')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">店铺header</text></div>
    </div>
    <OH3 class="title" >商品组件</OH3>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/input')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">商品分类列表</text></div>
      <div class="grid-cell" @click="jump('/select')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">带购物车的分类列表</text></div>
    </div>
    <OH3 class="title" >订单组件</OH3>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/input')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">地址组件</text></div>
      <div class="grid-cell" @click="jump('/select')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">清单组件</text></div>
      <div class="grid-cell" @click="jump('/select')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">下单组件</text></div>
    </div>
    <OH3 class="title" >订单组件</OH3>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/input')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">地址组件</text></div>
      <div class="grid-cell" @click="jump('/select')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">清单组件</text></div>
      <div class="grid-cell" @click="jump('/select')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">下单组件</text></div>
    </div>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/input')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">结果状态组件</text></div>
      <div class="grid-cell" @click="jump('/select')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">订单商品信息</text></div>
      <div class="grid-cell" @click="jump('/select')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">订单信息</text></div>
    </div>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/input')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">订单备注组件</text></div>
      <div class="grid-cell" @click="jump('/select')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">订单List</text></div>
    </div>
  </div>
</template>
<script>
export default {

}
</script>
<style lang="sass" scoped>
.grid-row{
  flex-direction: row;
}
.header{
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  height: 92px;
  padding-left: 36px;
  padding-right: 36px;
  padding-top:6px;
  padding-bottom:6px;
  background-color:#35495e;
}
.header_text {
  flex: 4;
  color: #fff;
  font-size: 36px;
  font-weight: 400;
  text-align: center;
  line-height: 40px;
  text-align:center;
  line-height: 87px;
}
.grid-cell{
  flex: 1;
  align-items: center;
  justify-content: center;
  padding: 30px;
  border-style: solid;
  border-width: 1px;
  border-color: #c7c7c7;
}
.text {
  font-size: 28px;
}
.title {
  padding: 20px;
}
</style>
