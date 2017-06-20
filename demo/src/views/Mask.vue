<template>
  <div>
    <div class="buttongroup">
      <OButton class="button-item" type="primary" size="large" @click="showMask" >显示Mask</OButton>
      <u-mask :show="$store.getters.maskVisiable" @click="onMaskClick">
    </u-mask>
    </div>
  </div>

</template>

<script>
import { mapActions } from 'vuex'
export default {
  methods: {
    ...mapActions(['toggleMask']),
    showMask () {
      this.toggleMask(true)
      setTimeout(() => {
        this.toggleMask(false)
      }, 3000)
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
.buttongroup{
  justify-content:center;
  align-items: center;
}
.button-item{
  margin-top: 20px;
  margin-bottom: 20px;
}
.inlineloading{
  flex-direction:rew;
  margin-bottom: 20px;
}
</style>
