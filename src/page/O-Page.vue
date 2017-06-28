<template>
  <div class="page-container" :class="pageiOSstata">
    <slot></slot>
  </div>
</template>
<script>
export default {
  name: 'OPage',
  computed: {
    pageiOSstata () {
      let type = WXEnvironment.platform
      const result = []
      if(type === 'iOS') {
          result.push(`page-container-iOS`)
      }else{
          result.push(`page-container-normal`)
      }
      return result
    }
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-page/o-page.scss'
</style>
