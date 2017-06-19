<template>
  <div class="tabbar-item" @click="onClick">
    <slot v-if="!actived" name="normal"></slot>
    <slot v-else name="active"></slot>
    <OIcon v-if="!$slots.normal&&$parent&&$parent.imageType==='iconfont'"
      class="icon-font"
      :color="icon_actived"
      :iconID="tabicon"></OIcon>
    <image v-if="!$slots.normal&&$parent&&$parent.imageType==='image'"
      class="icon-image"
      :src="img_actived"></image>
    <text class="text"
    :style="text_actived">{{label}}</text>
  </div>
</template>
<script>
import OIcon from '../icon/O-Icon'
const modal = weex.requireModule('modal')
export default {
  name: 'OTabbarItem',
  props: {
    label: {
      default: ''
    },
    index: String,
    // 图片模式的地址
    normalUrl: String,
    activeUrl: String,
    defaultColor: {
      default: '#999999'
    },
    activedColor: {
      default: '#09BB07'
    },
    tabicon: {
      default: '&#xe7d5'
    }
  },
  components: {
    OIcon
  },
  data () {
    return {
      $parent: null
    }
  },
  computed: {
    actived () {
      return this.$parent && this.$parent.value === this.index
    },
    // text_actived () {
    //   return [this.actived ? 'text-active' : '']
    // },
    text_actived () {
      return this.actived ? `color:${this.activedColor}` : `color:${this.defaultColor}`
    },
    img_actived () {
      return this.actived ? normalUrl : activeUrl
    },
    icon_actived () {
      return this.actived ? `${this.activedColor}` : `${this.defaultColor}`
    }
  },
  methods: {
    onClick () {
      if (this.$parent) {
        this.$parent.selectBar(this.index)
        if (this.$router && this.$parent.router) {
          this.$router.push(this.index)
        } else {
          this.$emit('click')
        }
      }
    }
  },
  created () {
    let parent = this.$parent
    while (parent.$parent && parent.$options._componentTag !== 'OTabbar') {
      parent = parent.$parent
    }
    if (parent.$options._componentTag !== 'OTabbar') {
      modal.toast({ message: 'u-tabbar-item不能单独使用', duration: 0.3 })
      return
    }
    this.$parent = parent
  },
  beforeDestroy () {
    this.$parent && this.$parent.removeBar(this)
  }
}
</script>
<style lang="sass" scoped>
.tabbar-item {
  flex: 1;
  height: 108px;
  align-items: center;
  justify-content: center;
  padding-top:10px;
}
.icon-font {
  font-size: 54px;
}

.icon-image {
  max-width: 54px;
  max-height: 54px;
}

.text {
  color: #999999;
  font-size: 22px;
  line-height: 22px;
}
.text-active {
  color: #09BB07;
}
</style>
