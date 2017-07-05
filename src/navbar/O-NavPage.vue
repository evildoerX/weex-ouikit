<template>
  <div class="onavpage">
    <osnavbar
      v-if="iswebnavbar"
      :dataRole="dataRole"
      :navbarshow="navbarshow"
      :navbarshowback="navbarshowback"
      :height="height"
      :size="size"
      :backgroundColor="backgroundColor"
      :title="title"
      :titleColor="titleColor"
      :navBackColor="navBackColor"
      :navBackText="navBackText"
      :leftItemSrc="leftItemSrc"
      :leftItemTitle="leftItemTitle"
      :leftItemColor="leftItemColor"
      :rightItemSrc="rightItemSrc"
      :rightItemTitle="rightItemTitle"
      :rightItemColor="rightItemColor"
      :rightItemSrcS="rightItemSrcS"
      :rightItemTitleS="rightItemTitleS"
      :rightItemColorS="rightItemColorS"
      @naviBarBackItemClick="naviBarBackItemClick"
      @naviBarRightItemClick="naviBarRightItemClick"
      @naviBarRightItemClickS="naviBarRightItemClickS"
      @naviBarLeftItemClick="naviBarLeftItemClick"></osnavbar>
      <div class="onavpageWrapper" :class="onavpageinit" :style="{top:`${navpagetop}px`,bottom:`${navpagebottom}px`}">
        <slot></slot>
      </div>
  </div>
</template>

<script>
  import osnavbar from './OC-Navbar.vue'
  export default {
    name: 'OPage',
    components: {
      osnavbar,
    },
    data () {
      return {
        //是否是web环境
        iswebnavbar:true,
        navpagetop:'',
        navpagebottom:''
      }
    },
    props: {
      // navbar
      dataRole: {
        default: 'none'
      },
      //导航条背景色
      backgroundColor: {
        default: '#0099FF'
      },
      //导航栏标题
      title: {
        default: '我是标题'
      },
      //导航条标题颜色
      titleColor: {
        default: '#FFFFFF'
      },
      //返回按钮文字
      navBackText: {
        default: '返回'
      },
      //返回按钮颜色
      navBackColor: {
        default: '#FFFFFF'
      },
       //导航左侧按钮文字颜色
      leftItemColor: {
        default: '#FFFFFF'
      },
      //导航右侧按钮文字颜色
      rightItemColor: {
        default: '#FFFFFF'
      },
      //导航右侧按钮文字颜色
      rightItemColorS: {
        default: '#FFFFFF'
      },
      //navbar按钮大小
      size: {
        default: '50'
      },
      //导航条高度
      height: {
        default: 88
      },
      //左侧图片
      leftItemSrc: {
        default: ''
      },
      //左侧文字
      leftItemTitle: {
        default: ''
      },
      //右侧图片
      rightItemSrc: {
        default: ''
      },
      //右侧文字
      rightItemTitle: {
        default: ''
      },
      //右侧图片
      rightItemSrcS: {
        default: ''
      },
      //右侧文字
      rightItemTitleS: {
        default: ''
      },
      //是否显示原生navbar
      navbarshow: {
        default: ''
      },
      //原生navbar是否显示返回
      navbarshowback: {
        default: ''
      },
      //原生navbar是否显示返回
      navbarallhide: {
        default: ''
      }
    },
    computed: {
      onavpageinit() {
        var self=this;
        let Envtype = WXEnvironment.platform;
        console.log(Envtype)
        if (Envtype === 'Web')
        {
          self.iswebnavbar = true
          self.navpagetop = 88
          self.navpagebottom = 109
        }
        else{
          self.iswebnavbar = false;
          self.navpagetop = 0
        }
        if (self.navbarallhide == 'hide') {
          self.iswebnavbar = false;
          self.navbarshow = 'hide';
          self.navpagetop = 0
        }
      }
    },
    methods: {
      naviBarRightItemClick (e) {
        this.$emit('naviBarRightItemClick', e)
        // const modal = weex.requireModule('modal')
        // modal.toast({ message: '传到page', duration: 0.3 })
      },
      naviBarRightItemClickS (e) {
        this.$emit('naviBarRightItemClickS', e)
        // const modal = weex.requireModule('modal')
        // modal.toast({ message: '传到pageS', duration: 0.3 })
      },
      naviBarLeftItemClick (e) {
        this.$emit('naviBarLeftItemClick', e)
        // const modal = weex.requireModule('modal')
        // modal.toast({ message: '传到左page', duration: 0.3 })
      },
      naviBarBackItemClick (e) {
        this.$emit('naviBarBackItemClick', e)
        // const modal = weex.requireModule('modal')
        // modal.toast({ message: '传到返回', duration: 0.3 })
      },
    }
  }
</script>

<style lang="sass" scoped>
@import '../theme-default/widget/o-navbar/o-navpage.scss'
</style>
