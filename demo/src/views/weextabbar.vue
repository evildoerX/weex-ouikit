<template>
  <div style="flex-direction: column;">
    <OWTabbar
      :tabItems="tabItems"
      @tabBarOnClick="tabBarOnClick"></OWTabbar>
  </div>
</template>

<script>
  module.exports = {
    data: function () {
      return {
        dir: 'examples',
        tabItems: [
          {
            index: 0,
            title: 'tab1',
            titleColor: '#000000',
            icon: '',
            image: 'http://gtms01.alicdn.com/tps/i1/TB1qw.hMpXXXXagXXXX9t7RGVXX-46-46.png',
            selectedImage: 'http://gtms04.alicdn.com/tps/i4/TB16jjPMpXXXXazXVXX9t7RGVXX-46-46.png',
            src: '11',
            num: '1',
            type: 'point',
            visibility: 'visible'
          },
          {
            index: 1,
            title: 'tab2',
            titleColor: '#000000',
            icon: '',
            image: 'http://gtms03.alicdn.com/tps/i3/TB1LEn9MpXXXXaUXpXX9t7RGVXX-46-46.png',
            selectedImage: 'http://gtms02.alicdn.com/tps/i2/TB1qysbMpXXXXcnXXXX9t7RGVXX-46-46.png',
            num: '1',
            src: 'component/tabbar/tabbar-item.js?itemId=tab2',
            visibility: 'hidden'
          },
          {
            index: 2,
            title: 'tab3',
            titleColor: '#000000',
            icon: '',
            image: 'http://gtms01.alicdn.com/tps/i1/TB1B0v5MpXXXXcvXpXX9t7RGVXX-46-46.png',
            selectedImage: 'http://gtms04.alicdn.com/tps/i4/TB1NxY5MpXXXXcrXpXX9t7RGVXX-46-46.png',
            num: '99',
            src: 'component/tabbar/tabbar-item.js?itemId=tab3',
            visibility: 'hidden'
          },
          {
            index: 3,
            title: 'tab3',
            titleColor: '#000000',
            icon: '',
            image: 'http://gtms01.alicdn.com/tps/i1/TB1B0v5MpXXXXcvXpXX9t7RGVXX-46-46.png',
            selectedImage: 'http://gtms04.alicdn.com/tps/i4/TB1NxY5MpXXXXcrXpXX9t7RGVXX-46-46.png',
            num: '199',
            src: 'component/tabbar/tabbar-item.js?itemId=tab3',
            visibility: 'hidden'
          }
        ]
      }
    },
    components: {
    },
    methods: {
      tabBarOnClick: function (e) {
        console.log('tabBarOnClick', e.index)
      }
    }
  }
</script>
