<template>
  <div
    :dataRole="dataRole"
    class="container"
    :style="{ height: `${height}px`}"
    v-on:click="ocCellItemClick">
    <div class="content">
      <div class="left-content">
        <image
          v-if="leftItemSrc"
          naviItemPosition="left"
          :src="leftItemSrc"
          class="left-image"></image>
        <text
          v-if="leftItemTitle"
          naviItemPosition="left"
          :style="{color:leftItemColor}"
          :class="lefttext">{{leftItemTitle}}</text>
        <text
          v-if="leftTip"
          naviItemPosition="left"
          class="left-tip">{{leftTip}}</text>
      </div>
      <div class="right-content">
        <text
          v-if="rightItemDisc"
          naviItemPosition="right"
          :style="{color:rightItemDiscColor}"
          class="rightItemDisc">{{rightItemDisc}}</text>
        <text
          v-if="rightItemTitle"
          naviItemPosition="right"
          :style="{color:rightItemColor}"
          :class="righttext">{{rightItemTitle}}</text>
      </div>
    </div>
  </div>
</template>

<style scoped lang="sass">
  .container {
    flex-direction: row;
    padding-left: 30px;
    width: 750px;
    margin-top: -1px;
  }
  .container:active {
    background-color: #ECECEC;
  }
  .content {
    flex-direction: row;
    border-top-style: solid;
    border-top-width: 1px;
    width: 720px;
    border-top-color: #D9D9D9;
  }
  .left-content {
    flex-direction: row;
    align-items: center;
    justify-content: center;
  }
  .left-text {
    font-size: 32px; 
    font-family: 'Open Sans', sans-serif;
  }
  .left-textA {
    font-size: 32px; 
    margin-left: 10px;
    font-family: 'Open Sans', sans-serif;
  }
  .left-tip {
    background-color: #f74c31;
    color: #fff;
    font-size: 24px;
    line-height:32px;
    font-family: 'Open Sans', sans-serif;
    text-align: center;
    border-radius: 16px;
    width: 32px;
    margin-left: 10px;
  }
  .left-image {
    width: 50px; 
    height: 50px;
  }
  .right-content {
    flex-direction: row;
    align-items: center;
    justify-content: center;
    position: absolute; 
    bottom: 20px; 
    right: 30px; 
  }
  .right-text {
    font-size: 32px; 
    font-family: 'Open Sans', sans-serif;
  }
  .right-textA {
    font-size: 32px; 
    margin-left: 10px;
    font-family: 'Open Sans', sans-serif;
  }
</style>

<script>
  module.exports = {
    data() {
      return {

      }
    },
    props: {
      dataRole: { default: 'navbar' },
      //导航条背景色
      backgroundColor: { default: 'white' },
      //导航条高度
      height: { default: 87 },
      //左侧按钮图片
      leftItemSrc: { default: '' },
      //左侧按钮标题
      leftItemTitle: { default: '' },
      //左侧tips
      leftTip: {default: ''},
      //左侧按钮颜色
      leftItemColor: { default: 'black' },
      //右侧按钮标题
      rightItemTitle: { default: '>' },
      //右侧按钮颜色
      rightItemColor: { default: '#999999' },
      //右侧描述文字
      rightItemDisc: { default: '' },
      //右侧描述颜色
      rightItemDiscColor: { default: '' }
    },
    methods: {
      ocCellItemClick: function (e) {
        this.$emit('ocCellItemClick');
      }
    },
    computed: {
      lefttext () {
        return [
          this.leftItemSrc ? `left-textA` : `left-text`,
        ]
      },
      righttext () {
        return [
          this.rightItemDisc ? `right-textA` : `right-text`,
        ]
      }
    }
  }
</script>
