<template>
  <div>
    <div class="tab-nav" ref="tabs">
      <text v-for="tab in tabs" class="tab" :class="[tab.value===value? 'tab-active' : '']" @click="selectTab(tab)">{{tab.label}}</text>
      <div class="line" ref="line" :style="{width: lineWidth+'px'}"></div>
    </div>
    <div class="tab-content">
      <slot></slot>
    </div>
  </div>
</template>
<script>
const animation = weex.requireModule('animation')
const dom = weex.requireModule('dom')
export default {
  name: 'OTabs',
  props: {
    value: {
      type: [String, Number, Boolean, Object, Array],
      default: 0
    }
  },
  data () {
    return {
      tabs: [],
      lineWidth: 0
    }
  },
  computed: {
    activeIndex () {
      return this.tabs.map(tab => tab.value).indexOf(this.value) || 0
    }
  },
  watch: {
    value (val) {
      this.$nextTick(() => {
        this.animateLine()
      })
    }
  },
  methods: {
    addTab (tab) {
      this.tabs.push(tab)
    },
    removeTab (tab) {
      this.tabs.splice(this.tabs.indexOf(tab), 1)
    },
    selectTab (tab) {
      this.$emit('input', tab.value)
      this.$emit('change', tab.value)
    },
    animateLine () {
      animation.transition(this.$refs.line, {
        duration: 300,
        timingFunction: 'ease-in-out',
        styles: {
          transform: `translateX(${this.activeIndex * this.lineWidth}px)`
        }
      })
    }
  },
  mounted () {
    this.$nextTick(() => {
      dom.getComponentRect(this.$refs.tabs, option => {
        this.lineWidth = option.size.width / this.tabs.length
        this.animateLine()
      })
    })
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-tab/o-tabs'
</style>
