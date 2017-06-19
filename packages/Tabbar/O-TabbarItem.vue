<template>
  <div class="tabbar-item" @click="onClick">
    <slot v-if="!actived" name="normal"></slot>
    <slot v-else name="active"></slot>
    <text v-if="!$slots.normal&&$parent&&$parent.imageType==='iconfont'"
      class="icon-font" :class="[actived ? 'icon-font-active' : '']" :style="{fontFamily}"><slot></slot></text>
    <image v-if="!$slots.normal&&$parent&&$parent.imageType==='image'"
      class="icon-image" :src="actived?normalUrl:activeUrl"></image>
    <text class="text" :class="[actived ? 'text-active' : '']">{{label}}</text>
  </div>
</template>
<script>
const modal = weex.requireModule('modal')
export default {
  name: 'OTabbarItem',
  props: {
    label: {
      type: String,
      required: true
    },
    index: String,
    // 图片模式的地址
    normalUrl: String,
    activeUrl: String,
    // iconfont模式的字体family
    fontFamily: {
      type: String,
      default: 'iconfont'
    }
  },
  data () {
    return {
      $parent: null
    }
  },
  computed: {
    actived () {
      return this.$parent && this.$parent.value === this.index
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
  height: 100px;
  align-items: center;
  justify-content: center;
}
.icon-font {
  color: #999999;
  font-size: 32px;
}

.icon-font-active {
  color: #09BB07;
}
.icon-image {
  max-width: 40px;
  max-height: 40px;
}

.text {
  color: #999999;
  font-size: 20px;
}
.text-active {
  color: #09BB07;
}
</style>
