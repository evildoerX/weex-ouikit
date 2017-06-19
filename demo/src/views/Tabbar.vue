<template>
  <div class="v-tabbar">
    <router-view></router-view>
    <!--<OTabbar  :value="$route.path" router>
      <OTabbarItem label="首页" index="/tabbar">&#xe7d5;</OTabbarItem>
      <OTabbarItem label="购物车" index="/tabbar/cart">&#xe7d8;</OTabbarItem>
      <OTabbarItem label="订单" index="/tabbar/order">&#xe6ac;</OTabbarItem>
      <OTabbarItem label="我的" index="/tabbar/my">&#xe736;</OTabbarItem>
    </OTabbar>-->
    <OTabbar
      :value="$route.path"
      router
      :tabbarItems="tabItems"
      defaultColor="black"
      activedColor="red"
      backgroundcolor="green"
      bordertopcolor="red" >
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
          index: '/tabbar',
          label: '首页',
          titleColor: '#000000',
          nlUrl: 'http://gtms01.alicdn.com/tps/i1/TB1qw.hMpXXXXagXXXX9t7RGVXX-46-46.png',
          aUrl: 'http://gtms04.alicdn.com/tps/i4/',
          icon: '&#xe7d5'
        },
        {
          index: '/tabbar/cart',
          label: '购物车',
          titleColor: '#000000',
          nUrl: 'http://gtms01.alicdn.com/tps/i1/TB1qw.hMpXXXXagXXXX9t7RGVXX-46-46.png',
          aUrl: 'http://gtms04.alicdn.com/tps/i4/',
          icon: '&#xe7d8'
        },
        {
          index: '/tabbar/order',
          label: '订单',
          titleColor: '#000000',
          nUrl: 'http://gtms01.alicdn.com/tps/i1/TB1qw.hMpXXXXagXXXX9t7RGVXX-46-46.png',
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
