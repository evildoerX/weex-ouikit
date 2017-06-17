<template>
  <div class="buttongroup">
    <OButton class="button-item" type="primary" size="large" @click="showLoading" >显示loading(2s后关闭)</OButton>
    <OLoading v-if="$store.getters.loadingVisiable">Loading</OLoading>
  </div>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  methods: {
    ...mapActions(['toggleLoading']),
    showLoading () {
      this.toggleLoading(true)
      setTimeout(() => {
        this.toggleLoading(false)
      }, 2000)
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
</style>
