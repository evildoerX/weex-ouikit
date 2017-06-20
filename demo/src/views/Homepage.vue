<template>
  <div class="v-homepage grid">
    <div class="header">
      <text class="header_text">O-UI</text>
    </div>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/color')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">颜色</text></div>
      <div class="grid-cell" @click="jump('/text')">
        <CIcon size="46" color="#04be02" iconID="&#xe692"></CIcon>
        <text class="text">文本</text></div>
      <div class="grid-cell" @click="jump('/iconfont')">
        <CIcon size="46" color="#04be02" iconID="&#xe74e"></CIcon>
        <text class="text">iconfont</text></div>
    </div>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/button')">
        <CIcon size="46" color="#04be02" iconID="&#xe72f"></CIcon>
        <text class="text">按钮</text></div>
      <div class="grid-cell" @click="jump('/radio')">
        <CIcon size="46" color="#04be02" iconID="&#xe627"></CIcon>
        <text class="text">单选</text></div>
      <div class="grid-cell" @click="jump('/checkbox')">
        <CIcon size="46" color="#04be02" iconID="&#xe72e"></CIcon>
        <text class="text">多选</text></div>
    </div>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/cell')">
        <CIcon size="46" color="#04be02" iconID="&#xe60a"></CIcon>
        <text class="text">列表</text></div>
      <div class="grid-cell" @click="jump('/input-number')">
        <CIcon size="46" color="#04be02" iconID="&#xe6e6"></CIcon>
        <text class="text">数字选择</text></div>
      <div class="grid-cell" @click="jump('/badge')">
        <CIcon size="46" color="red" iconID="&#xe632"></CIcon>
        <text class="text">Badge</text></div>
    </div>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/loading')">
        <CIcon size="46" color="#04be02" iconID="&#xe6a1"></CIcon>
        <text class="text">Loading</text></div>
      <div class="grid-cell" @click="jump('/inlineloading')">
        <CIcon size="46" color="#04be02" iconID="&#xe6a1"></CIcon>
        <text class="text">InLineLoading</text></div>
      <div class="grid-cell" @click="jump('/loadingmore')">
        <CIcon size="46" color="#04be02" iconID="&#xe6a1"></CIcon>
        <text class="text">LoadingMore</text></div>
    </div>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/tabbar')">
        <CIcon size="46" color="#04be02" iconID="&#xe754"></CIcon>
        <text class="text">Tabbar</text></div>
      <div class="grid-cell" @click="jump('/navbar')">
        <CIcon size="46" color="#04be02" iconID="&#xe8ed"></CIcon>
        <text class="text">Navbar</text></div>
      <div class="grid-cell" @click="jump('/tab')">
        <CIcon size="46" color="#04be02" iconID="&#xe60c"></CIcon>
        <text class="text">Tabs</text></div>
    </div>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/switch')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">switch</text></div>
      <div class="grid-cell" @click="jump('/mask')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">mask</text></div>
      <div class="grid-cell" @click="jump('/rater')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">评分</text></div>
    </div>
    <!--<div class="grid-row">
      <div class="grid-cell" @click="jump('/input')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">输入框(待优化)</text></div>
      <div class="grid-cell" @click="jump('/input-number')">
        <CIcon size="46" color="#04be02" iconID="&#xe6e6"></CIcon>
        <text class="text">数字选择</text></div>
      <div class="grid-cell" @click="jump('/select')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">下拉(待优化)</text></div>
    </div>-->
    <!--<div class="grid-row">
      <div class="grid-cell" @click="showLoading">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">加载动画(仅做参考)</text></div>
      <div class="grid-cell" @click="jump('/tab')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">Tab页(待修复)</text></div>
      <div class="grid-cell" @click="jump('/progress')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">进度条</text></div>
    </div>-->
    <!--<div class="grid-row">
      <div class="grid-cell" @click="jump('/cell')">
        <CIcon size="46" color="#04be02" iconID="&#xe60a"></CIcon>
        <text class="text">列表</text></div>
      <div class="grid-cell" @click="jump('/tabbar')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">Tabbar</text></div>
      <div class="grid-cell" @click="jump('/checker')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">全选</text></div>
    </div>-->
    <!--<div class="grid-row">
      <div class="grid-cell" @click="jump('/range')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">Range(原生有坑)</text></div>
      <div class="grid-cell" @click="jump('/badge')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">Badge</text></div>
      <div class="grid-cell" @click="jump('/rater')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">评分</text></div>
    </div>-->
    <!--<div class="grid-row">
      <div class="grid-cell" @click="jump('/timeline')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">时间轴</text></div>
      <div class="grid-cell" @click="jump('/resource')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">远程请求(简单封装)</text></div>
      <div class="grid-cell" @click="jump('/date-format')">
        <CIcon size="46" color="#04be02" iconID="&#xe6d0"></CIcon>
        <text class="text">简单的时间格式化</text></div>
    </div>-->
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
</style>
