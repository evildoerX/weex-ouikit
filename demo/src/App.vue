<template>
  <div class="v-app" style="flex-direction:column;" :style="{height:appHeight}">
    <ONavbar style="background-color:#35495e;" v-if="$route.path!=='/'">
      <v-icon slot="left" color="#fff" @click="$router.go(-1)">&#xe621;</v-icon>
        {{$store.getters.title}}
      <v-icon slot="right" color="#fff" @click="copy">&#xe666;</v-icon>
    </ONavbar>
     <!--<scroller style="flex:1;">-->
      <router-view></router-view>
     <!--</scroller>-->
  </div>
</template>
<script>
const clipboard = weex.requireModule('clipboard')
const modal = weex.requireModule('modal')
export default {
  data () {
    return {
      appHeight: weex.config.deviceHeight + 'px'
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
.v-app {
  background-color: #f9fafc;
}
</style>
