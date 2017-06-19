<template>
  <div class="tabbar">
    <router-view></router-view>
    <OTabbar
      :value="$route.path"
      router
      :tabbarItems="tabItems">
    </OTabbar>
  </div>
</template>
<script>
export default {
  data () {
    return {
      activeIndex: '1-2',
      tabItems: [
        {
          index: '/button',
          label: '首页',
          titleColor: '#000000',
          nUrl: 'http://gtms01.alicdn.com/tps/i1/TB1qw.hMpXXXXagXXXX9t7RGVXX-46-46.png',
          aUrl: 'http://gtms04.alicdn.com/tps/i4/',
          icon: '&#xe7d5'
        },
        {
          index: '/tabbar/cart',
          label: '购物车',
          titleColor: '#000000',
          nUrl: 'http://gtms03.alicdn.com/tps/i3/TB1LEn9MpXXXXaUXpXX9t7RGVXX-46-46.png',
          aUrl: 'http://gtms04.alicdn.com/tps/i4/',
          icon: '&#xe7d8'
        },
        {
          index: '/tabbar/order',
          label: '订单',
          titleColor: '#000000',
          nUrl: 'http://gtms01.alicdn.com/tps/i1/TB1B0v5MpXXXXcvXpXX9t7RGVXX-46-46.png',
          aUrl: 'http://gtms04.alicdn.com/tps/i4/',
          icon: '&#xe804'
        },
        {
          index: '/tabbar/my',
          label: '我的',
          titleColor: '#000000',
          nUrl: 'http://gtms01.alicdn.com/tps/i1/TB1qw.hMpXXXXagXXXX9t7RGVXX-46-46.png',
          aUrl: 'http://gtms04.alicdn.com/tps/i4/',
          icon: '&#xe736;'
        }
      ]
    }
  }
}
</script>
<style lang="sass" scoped>

</style>
