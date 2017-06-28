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
      return [
        type === 'iOS' ? `page-container-iOS` : ``,
      ]
    }
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-page/o-page.scss'
</style>
