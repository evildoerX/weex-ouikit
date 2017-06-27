<template>
  <div class="wrapper">
    <embed
        class="content"
        :style="{ visibility: item.visibility }"
        v-for="(item, index) in tabItems"
        :key="index"
        :src="item.src"
        type="weex">
    </embed>
    <div class="tabbar" append="tree">
      <tabitem
          v-for="(item, index) in tabItems"
          :key="index"
          :index="item.index"
          :iconimage="item.image"
          :label="item.label"
          :titleColor="item.titleColor"
          :iconcolor="item.titleColor"
          :tabicon="item.icon"
          @tabItemOnClick="tabItemOnClick">
      </tabItem>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'OWTabbar',
    props: {
      tabItems: {
        default: []
      },
      selectedColor: {
        default: '#09BB07'
      },
      unselectedColor: {
        default: '#999999'
      },
      imageType: {
        type: String,
        // 支持iconfont image, svg模式不好处理子节点的颜色，此时可以用slot处理
        default: 'iconimage'
      },
    },
    data () {
      return {
        selectedIndex: 0
      }
    },
    components: {
      tabitem: require('./OW-TabbarItem.vue')
    },
    created () {
      this.select(this.selectedIndex)
    },
    methods: {
      tabItemOnClick (e) {
        this.selectedIndex = e.index
        this.select(e.index)
        this.$emit('tabBarOnClick', e)
      },
      select (index) {
        for (let i = 0; i < this.tabItems.length; i++) {
          let tabItem = this.tabItems[i]
          if (i == index) {
            tabItem.image = tabItem.selectedImage
            tabItem.titleColor = this.selectedColor
            tabItem.visibility = 'visible'
          } else {
            tabItem.image = tabItem.image
            tabItem.titleColor = this.unselectedColor
            tabItem.visibility = 'hidden'
          }
        }
      }
    }
  }
</script>

<style>
  .wrapper {
    width: 750px;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
  }

  .content {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    margin-top: 0;
    margin-bottom: 88px;
  }

  .tabbar {
    flex-direction: row;
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    height: 108px;
    border-top-style: solid;
    border-top-width: 1px;
    border-top-color: #C0BFC4;
  }
</style>
