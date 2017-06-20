<template>
  <div class="navbarcontent">
    <OH2 class="title">仅返回</OH2>
    <ONavbar
      style="background-color:#35495e;"
      :title="$store.getters.title"
      v-if="$route.path!=='/'">
      <OIcon slot="left" color="#fff" @click="$router.go(-1)" iconID="&#xe80c;"></OIcon>
    </ONavbar>
    <OH2 class="title">左边返回，右边按钮</OH2>
    <ONavbar
      style="background-color:#35495e;"
      :title="$store.getters.title"
      v-if="$route.path!=='/'">
      <OIcon slot="left" color="#fff" @click="$router.go(-1)" iconID="&#xe80c;"></OIcon>
      <OIcon slot="right" color="#fff" @click="copy">&#xe666;</OIcon>
    </ONavbar>
    <OH2 class="title">左侧按钮+文字</OH2>
    <ONavbar
      style="background-color:#35495e;"
      :title="$store.getters.title"
      v-if="$route.path!=='/'">
      <OIcon slot="left" color="#fff" style="margin-right:20px;" @click="$router.go(-1)" iconID="&#xe80c;"></OIcon>
      <OIcon slot="left" color="#fff" @click="$router.go(-1)" iconID="返回"></OIcon>
      <OIcon slot="right" color="#fff" style="margin-right:20px;" @click="copy" iconID="&#xe6f3;"></OIcon>
      <OIcon slot="right" color="#fff" @click="copy" iconID="&#xe7f7;"></OIcon>
    </ONavbar>
  </div>
</template>
<script>
const modal = weex.requireModule('modal')
export default {
  data () {
    return {
      appHeight: weex.config.deviceHeight + 'px'
    }
  },
  methods: {
    copy () {
      modal.toast({ message: '已点击按钮', duration: 0.3 })
    },
    onMaskClick () {
      if (!this.$store.getters.loadingVisiable) {
        this.$store.dispatch('toggleMask', false)
      }
    }
  }
}
</script>
<style lang="sass" scoped>
.title {
  margin-top:10px;
  margin-bottom:10px;
  padding-left:10px;
}
</style>
