<template>
  <div class="app">
    <scroller class="content">
      <transition  name="fade" mode="out-in">
        <router-view ></router-view>
      </transition>
     </scroller>
    <ONavbar
      style="background-color:#35495e;"
      class="header"
      :title="$store.getters.title"
      v-if="$route.path!=='/'">
      <OIcon slot="left" color="#fff" @click="$router.go(-1)" iconID="&#xe80c;"></OIcon>
      <OIcon slot="right" color="#fff" @click="copy" iconID="&#xe7d4;"></OIcon>
    </ONavbar>
  </div>
</template>
<script>
const clipboard = weex.requireModule('clipboard')
const modal = weex.requireModule('modal')
export default {
  data () {
    return {
    }
  },
  methods: {
    copy () {
      clipboard.setString(weex.config.bundleUrl)
      modal.toast({ message: '已复制地址', duration: 0.3 })
    },
    onMaskClick () {
      if (!this.$store.getters.loadingVisiable) {
        this.$store.dispatch('toggleMask', false)
      }
    }
  }
}
</script>
<style scoped>
.fade-enter-active, .fade-leave-active {
  transition: opacity .3s
}
.fade-enter, .fade-leave-active {
  opacity: 0
}
.app {
  background-color: #f9fafc;
}
.header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
}
.content {
  margin-top:88px;
}
</style>
