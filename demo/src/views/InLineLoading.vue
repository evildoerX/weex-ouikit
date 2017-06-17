<template>
  <div>
    <div class="inlineloading">
      <OInLineLoading></OInLineLoading>
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
