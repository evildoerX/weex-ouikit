<template>
  <div>
    <slider class="slider"
      @change="onchange">
      <div class="frame" v-for="img in imageList">
        <image class="image" resize="cover" :src="img.src"></image>
        <text class="title">{{img.title}}</text>
      </div>
      <indicator class="indicator"></indicator>
    </slider>
    <slider class="slider"
      auto-play="true"
      interval="5000" @change="onchange">
      <div class="frame" v-for="img in imageList">
        <image class="image" resize="cover" :src="img.src"></image>
        <text class="title">{{img.title}}</text>
      </div>
      <indicator class="indicator"></indicator>
    </slider>
  </div>
</template>

<style scoped>
.slider {
  margin-top: 25px;
  height: 360px;
}
.frame {
  height: 360px;
  position: relative;
}
.image {
  width: 750px;
  height: 360px;
}
.title {
  position: absolute;
  top: 20px;
  left: 20px;
  padding-left: 20px;
  width: 200px;
  color: #FFFFFF;
  font-size: 36px;
  line-height: 60px;
  background-color: rgba(0, 0, 0, 0.3);
}

.indicator {
  item-color: white;
  item-selected-color: black;
  item-size: 12px;
  position: absolute;
  right: 30px;
  bottom: 20px;
}
</style>

<script>
  export default {
    data () {
      return {
        imageList: [
          { title: 'item A', src: 'https://gd2.alicdn.com/bao/uploaded/i2/T14H1LFwBcXXXXXXXX_!!0-item_pic.jpg' },
          { title: 'item B', src: 'https://gd1.alicdn.com/bao/uploaded/i1/TB1PXJCJFXXXXciXFXXXXXXXXXX_!!0-item_pic.jpg' },
          { title: 'item C', src: 'https://gd3.alicdn.com/bao/uploaded/i3/TB1x6hYLXXXXXazXVXXXXXXXXXX_!!0-item_pic.jpg' }
        ]
      }
    },
    methods: {
      onchange (event) {
        console.log('changed:', event.index)
      }
    }
  }
</script>
