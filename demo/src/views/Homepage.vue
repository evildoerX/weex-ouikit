<template>
  <div class="v-homepage grid">
    <div class="header">
      <text class="header_text">O-UI</text>
    </div>
    <div class="content">
      <div class="grid-row">
        <div class="grid-cell" @click="jump('/color')">
          <OIcon size="46" color="#04be02" iconID="&#xe6d0"></OIcon>
          <text class="text">颜色</text></div>
        <div class="grid-cell" @click="jump('/text')">
          <OIcon size="46" color="#04be02" iconID="&#xe692"></OIcon>
          <text class="text">文本</text></div>
        <div class="grid-cell" @click="jump('/iconfont')">
          <OIcon size="46" color="#04be02" iconID="&#xe74e"></OIcon>
          <text class="text">iconfont</text></div>
      </div>
      <div class="grid-row">
        <div class="grid-cell" @click="jump('/button')">
          <OIcon size="46" color="#04be02" iconID="&#xe72f"></OIcon>
          <text class="text">按钮</text></div>
        <div class="grid-cell" @click="jump('/radio')">
          <OIcon size="46" color="#04be02" iconID="&#xe627"></OIcon>
          <text class="text">单选</text></div>
        <div class="grid-cell" @click="jump('/checkbox')">
          <OIcon size="46" color="#04be02" iconID="&#xe72e"></OIcon>
          <text class="text">多选</text></div>
      </div>
      <div class="grid-row">
        <div class="grid-cell" @click="jump('/cell')">
          <OIcon size="46" color="#04be02" iconID="&#xe60a"></OIcon>
          <text class="text">列表</text></div>
        <div class="grid-cell" @click="jump('/input-number')">
          <OIcon size="46" color="#04be02" iconID="&#xe6e6"></OIcon>
          <text class="text">数字选择</text></div>
        <div class="grid-cell" @click="jump('/badge')">
          <OIcon size="46" color="red" iconID="&#xe632"></OIcon>
          <text class="text">Badge</text></div>
      </div>
      <div class="grid-row">
        <div class="grid-cell" @click="jump('/loading')">
          <OIcon size="46" color="#04be02" iconID="&#xe6a1"></OIcon>
          <text class="text">Loading</text></div>
        <div class="grid-cell" @click="jump('/inlineloading')">
          <OIcon size="46" color="#04be02" iconID="&#xe6a1"></OIcon>
          <text class="text">InLineLoading</text></div>
        <div class="grid-cell" @click="jump('/loadingmore')">
          <OIcon size="46" color="#04be02" iconID="&#xe6a1"></OIcon>
          <text class="text">LoadingMore</text></div>
      </div>
      <div class="grid-row">
        <div class="grid-cell" @click="jump('/tabbar')">
          <OIcon size="46" color="#04be02" iconID="&#xe754"></OIcon>
          <text class="text">Tabbar</text></div>
        <div class="grid-cell" @click="jump('/tab')">
          <OIcon size="46" color="#04be02" iconID="&#xe8ed"></OIcon>
          <text class="text">Navbar</text></div>
        <div class="grid-cell" @click="jump('/tab')">
          <OIcon size="46" color="#04be02" iconID="&#xe60c"></OIcon>
          <text class="text">Tabs</text></div>
      </div>
      <!--<div class="grid-row">
        <div class="grid-cell" @click="jump('/input')">
          <OIcon size="46" color="#04be02" iconID="&#xe6d0"></OIcon>
          <text class="text">输入框(待优化)</text></div>
        <div class="grid-cell" @click="jump('/input-number')">
          <OIcon size="46" color="#04be02" iconID="&#xe6e6"></OIcon>
          <text class="text">数字选择</text></div>
        <div class="grid-cell" @click="jump('/select')">
          <OIcon size="46" color="#04be02" iconID="&#xe6d0"></OIcon>
          <text class="text">下拉(待优化)</text></div>
      </div>-->
      <!--<div class="grid-row">
        <div class="grid-cell" @click="showLoading">
          <OIcon size="46" color="#04be02" iconID="&#xe6d0"></OIcon>
          <text class="text">加载动画(仅做参考)</text></div>
        <div class="grid-cell" @click="jump('/tab')">
          <OIcon size="46" color="#04be02" iconID="&#xe6d0"></OIcon>
          <text class="text">Tab页(待修复)</text></div>
        <div class="grid-cell" @click="jump('/progress')">
          <OIcon size="46" color="#04be02" iconID="&#xe6d0"></OIcon>
          <text class="text">进度条</text></div>
      </div>-->
      <!--<div class="grid-row">
        <div class="grid-cell" @click="jump('/cell')">
          <OIcon size="46" color="#04be02" iconID="&#xe60a"></OIcon>
          <text class="text">列表</text></div>
        <div class="grid-cell" @click="jump('/tabbar')">
          <OIcon size="46" color="#04be02" iconID="&#xe6d0"></OIcon>
          <text class="text">Tabbar</text></div>
        <div class="grid-cell" @click="jump('/checker')">
          <OIcon size="46" color="#04be02" iconID="&#xe6d0"></OIcon>
          <text class="text">全选</text></div>
      </div>-->
      <!--<div class="grid-row">
        <div class="grid-cell" @click="jump('/range')">
          <OIcon size="46" color="#04be02" iconID="&#xe6d0"></OIcon>
          <text class="text">Range(原生有坑)</text></div>
        <div class="grid-cell" @click="jump('/badge')">
          <OIcon size="46" color="#04be02" iconID="&#xe6d0"></OIcon>
          <text class="text">Badge</text></div>
        <div class="grid-cell" @click="jump('/rater')">
          <OIcon size="46" color="#04be02" iconID="&#xe6d0"></OIcon>
          <text class="text">评分</text></div>
      </div>-->
      <!--<div class="grid-row">
        <div class="grid-cell" @click="jump('/timeline')">
          <OIcon size="46" color="#04be02" iconID="&#xe6d0"></OIcon>
          <text class="text">时间轴</text></div>
        <div class="grid-cell" @click="jump('/resource')">
          <OIcon size="46" color="#04be02" iconID="&#xe6d0"></OIcon>
          <text class="text">远程请求(简单封装)</text></div>
        <div class="grid-cell" @click="jump('/date-format')">
          <OIcon size="46" color="#04be02" iconID="&#xe6d0"></OIcon>
          <text class="text">简单的时间格式化</text></div>
      </div>-->
    </div>
  </div>
</template>
<script>
export default {

}
</script>
<style lang="sass" scoped>
.content{
  margin-top:88px;
}
.grid-row{
  flex-direction: row;
}
.header{
  position: fixed;
  top:0;
  width:750px;
  height:87px;
  background-color:#35495e;
}
.header_text {
  text-align:center;
  color:white;
  font-size:50px;
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
