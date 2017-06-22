<template>
  <div class="tabbar-item" @click="onClick">
    <slot v-if="!actived" name="normal"></slot>
    <slot v-else name="active"></slot>
    <CIcon v-if="!$slots.normal&&$parent&&$parent.imageType==='iconfont'"
      size="54"
      :color="icon_actived"
      :iconID="tabicon"></CIcon>
    <image v-if="!$slots.normal&&$parent&&$parent.imageType==='image'"
      class="icon-image"
      :src="img_actived"></image>
    <text class="text"
    :style="text_actived">{{label}}</text>
  </div>
</template>
<script>
import CIcon from '../icon/C-Icon'
const modal = weex.requireModule('modal')
export default {
  name: 'OTabbarItem',
  props: {
    label: {
      default: ''
    },
    index: String,
    // 图片模式的地址
    normalUrl: {
      default: ''
    },
    activeUrl: {
      default: ''
    },
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
    CIcon
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
      return this.actived ? {color:this.activedColor} : {color:this.defaultColor}
    },
    img_actived () {
      return this.actived ? `${this.activeUrl}` : `${this.normalUrl}`
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
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.icon-image {
  width: 54px;
  height: 54px;
  margin-bottom: 5px;
}

.text {
  font-size: 20px;
  text-align: center;
}
</style>
