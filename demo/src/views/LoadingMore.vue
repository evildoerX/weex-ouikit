<template>
  <div>
    <div class="inlineloading">
      <OLoadingMore>正在加载</OLoadingMore>
    </div>
    <div class="inlineloading">
      <OLoadingMore :showloading="false" color="#999999" backgroundcolor="#f9fafc">正在加载</OLoadingMore>
    </div>
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
.inlineloading{
  margin-top: 20px;
  flex-direction:rew;
  margin-bottom: 20px;
}
</style>
