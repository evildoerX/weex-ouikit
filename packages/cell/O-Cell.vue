<template>
  <div
    class="container"
    :style="{ height: `${height}px`}"
    @click="click"
    @longpress="longpress">
    <div class="content">
      <div class="left-content">
        <image
          v-if="Src"
          :src="Src"
          class="left-image"></image>
        <text
          v-if="Title"
          :style="{color:TitleColor}"
          :class="lefttext">{{Title}}</text>
        <text
          v-if="Tip"
          class="left-tip">{{Tip}}</text>
      </div>
      <div class="right-content">
        <text
          v-if="value"
          :style="{color:valueColor}"
          :class="valuetext">{{value}}</text>
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
    position: relative;
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
    font-size: 34px;
    font-family: 'Open Sans', sans-serif;
  }
  .left-textA {
    font-size: 34px;
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
    font-size: 34px;
    font-family: 'Open Sans', sans-serif;
  }
  .right-textA {
    font-size: 34px;
    margin-left: 10px;
    font-family: 'Open Sans', sans-serif;
  }
</style>

<script>
  export default {
    name: 'OCell',
    data () {
      return {
      }
    },
    props: {
      //导航条背景色
      backgroundColor: { default: 'white' },
      //导航条高度
      height: { default: 87 },
      //左侧按钮图片
      Src: { default: '' },
      //左侧按钮标题
      Title: { default: '' },
      //左侧tips
      Tip: {default: '' },
      //左侧按钮颜色
      TitleColor: { default: 'black' },
      //右侧值
      value: { default: '>' },
      //右侧值颜色
      valueColor: { default: '#999999' }
    },
    methods: {
      click (e) {
        this.$emit('click', e)
      },
      longpress (e) {
        this.$emit('longpress', e)
      }
    },
    computed: {
      lefttext () {
        return [
          this.Src ? `left-textA` : `left-text`
        ]
      },
      valuetext () {
        return [
          this.value ? `right-textA` : `right-text`
        ]
      }
    }
  }
</script>
