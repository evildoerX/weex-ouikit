<template>
  <div class="tabbar"
    :style="{'background-color':backgroundcolor,'border-top-color':bordertopcolor}">
    <OTabbarItem
      v-for="item in tabbarItems"
      :key="item.index"
      :index="item.index"
      :label="item.label"
      :defaultColor="tabdefaultColor"
      :activedColor="tabactivedColor"
      :normalUrl="item.nUrl"
      :activeUrl="item.aUrl"
      :tabicon="item.icon"></OTabbarItem>
  </div>
</template>
<script>
import OTabbarItem from './O-TabbarItem'
export default {
  name: 'OTabbar',
  props: {
    tabbarItems: {
      default: []
    },
    value: {
      type: String
    },
    // 是否使用路由模式，如果是，则点击item时使用item的index进行跳转
    router: {
      type: Boolean,
      default: false
    },
    imageType: {
      type: String,
      // 支持iconfont image, svg模式不好处理子节点的颜色，此时可以用slot处理
      default: 'iconfont'
    },
    backgroundcolor: {
      default:'#F7F7FA'
    },
    bordertopcolor: {
      default:'#D9D9D9'
    },
    defaultColor: {
      default:'#999999'
    },
    activedColor: {
      default:'#09BB07'
    }
  },
  components: {
    OTabbarItem
  },
  data () {
    return {
      bars: [],
      tabdefaultColor:'',
      tabactivedColor:''
    }
  },
  created() {
    this.tabdefaultColor = this.defaultColor,
    this.tabactivedColor = this.activedColor
  },
  computed: {
    activeIndex () {
      return this.bars.map(bar => bar.index).indexOf(this.value) || 0
    }
  },
  methods: {
    addBar (bar) {
      this.bars.push(bar)
    },
    removeBar (bar) {
      this.bars.splice(this.bars.indexOf(bar), 1)
    },
    selectBar (bar) {
      this.$emit('input', bar)
      this.$emit('change', bar)
    }
  }
}
</script>
<style lang="sass" scoped>
.tabbar {
  position: fixed;
  flex-direction: row;
  align-items: center;
  bottom: 0px;
  left: 0px;
  right: 0px;
  border-top-style: solid;
  border-top-width: 1px;
}
</style>
