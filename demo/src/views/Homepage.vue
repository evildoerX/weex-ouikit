<template>
  <div class="homepage grid">
    <div class="header">
      <text class="header_text">O-UI</text>
    </div>
    <OH3 class="title" style="margin-top:88px;" >基础组件</OH3>
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
        <CIcon size="46" color="#04be02" iconID="&#xed3d;"></CIcon>
        <text class="text">switch</text></div>
      <div class="grid-cell" @click="jump('/mask')">
        <CIcon size="46" color="#04be02" iconID="&#xe608;"></CIcon>
        <text class="text">mask</text></div>
      <div class="grid-cell" @click="jump('/rater')">
        <CIcon size="46" color="#04be02" iconID="&#xe7f1;"></CIcon>
        <text class="text">评分</text></div>
    </div>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/input')">
        <CIcon size="46" color="#04be02" iconID="&#xe600;"></CIcon>
        <text class="text">输入框</text></div>
      <div class="grid-cell" @click="jump('/date-format')">
        <CIcon size="46" color="#04be02" iconID="&#xe708;"></CIcon>
        <text class="text">时间格式化</text></div>
      <div class="grid-cell" @click="jump('/timeline')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">轮播图</text></div>
    </div>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/input')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">地址pick</text></div>
      <div class="grid-cell" @click="jump('/select')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">时间Pick</text></div>
      <div class="grid-cell" @click="jump('/timeline')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">PickData</text></div>
    </div>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/input')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">ActionSheet</text></div>
      <div class="grid-cell" @click="jump('/select')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">Modal</text></div>
      <div class="grid-cell" @click="jump('/timeline')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">Toast</text></div>
    </div>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/input')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">下拉刷新</text></div>
      <div class="grid-cell" @click="jump('/select')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">上滑加载更多</text></div>
      <div class="grid-cell" @click="jump('/timeline')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">SwipeAction</text></div>
    </div>
    <OH3 class="title" >业务组件</OH3>
    <div class="grid-row">
      <div class="grid-cell" @click="jump('/input')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">注册登录</text></div>
      <div class="grid-cell" @click="jump('/select')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">用户信息</text></div>
      <div class="grid-cell" @click="jump('/goods')">
        <CIcon size="46" color="red" iconID="&#xe810;"></CIcon>
        <text class="text">商品类组件库</text></div>
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
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
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
