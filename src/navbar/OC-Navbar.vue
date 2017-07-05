<template>
  <div
    :dataRole="dataRole"
    class="ocnavbar"
    :style="{ height: height + 'px', backgroundColor: backgroundColor}">
    <div class="o-navbar-left">
      <div v-if="navbarshowback == 'show'" class="navleft-content">
        <div
          class="navleftback"
          :style="[{'border-left-color':navBackColor,'border-top-color':navBackColor,}]"
          @click="onClickBack"></div>
        <OIcon
          :size="navBackTextsize"
          :iconID="navBackText"
          :color="navBackColor"
          @click="onClickBack"></OIcon>
      </div>
      <div class="navleft-content">
        <OIcon
          v-if="!leftItemSrc && leftItemTitle"
          :size="size"
          :iconID="leftItemTitle"
          :color="leftItemColor"
          @click="onClickLeft"></OIcon>
        <image
          v-if="leftItemSrc"
          class="img"
          :src="leftItemSrc"
          @click="onClickLeft"></image>
      </div>
    </div>
    <text
    class="o-navbar-title"
    :style="{ color: titleColor}">{{title}}</text>
    <div class="o-navbar-right">
      <div class="navleft-content">
        <OIcon
          v-if="!rightItemSrcS && rightItemTitleS"
          :size="size"
          :iconID="rightItemTitleS"
          :color="rightItemColorS"
          @click="onClickRightS"></OIcon>
        <image
          v-if="rightItemSrcS"
          class="img"
          :src="rightItemSrcS"
          @click="onClickRightS"></image>
      </div>
      <div class="navleft-content">
        <OIcon
          v-if="!rightItemSrc && rightItemTitle"
          :size="size"
          :iconID="rightItemTitle"
          :color="rightItemColor"
          @click="onClickRight"></OIcon>
        <image
          v-if="rightItemSrc"
          class="img"
          :src="rightItemSrc"
          @click="onClickRight"></image>
      </div>
    </div>
  </div>
</template>

<script>
  import OIcon from '../icon/O-Icon.vue'
  export default {
    name: 'OCNavbar',
    components: {
      OIcon,
    },
    data () {
      return {
        // navbarshow: true,
        callbackdata:''
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
      //返回按钮颜色
      navBackText: {
        default: '返回'
      },
      navBackTextsize: {
        default: '40'
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
      //导航条高度
      height: {
        default: 88
      },
      //navbar按钮高度
      size: {
        default: '50'
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
      }
    },
    methods:{
      present(){
        var self=this;
        var nav = weex.requireModule('navigator') ;
        nav.presentFull('present.js',{a:'okoko'},true,function (e) {
            self.callbackdata=e.ok;
        },true);
      },
      pushwidthparam()
      {
        var self=this;
        var nav = weex.requireModule('navigator') ;
        nav.setPageId('navigator');
        nav.pushFull('nav1.js',{a:'这是传过来的值'},function (e) {
          self.callbackdata=e.ok;
        },true);
      },
      onClickBack(){
         this.$emit('naviBarBackItemClick')
        //  const modal = weex.requireModule('modal')
        // modal.toast({ message: '点击返回按钮', duration: 0.3 })
      },
      onClickLeft(){
         this.$emit('naviBarLeftItemClick')
        //  const modal = weex.requireModule('modal')
        // modal.toast({ message: '传到左navbar', duration: 0.3 })
      },
      onClickRight(){
         this.$emit('naviBarRightItemClick')
        //  const modal = weex.requireModule('modal')
        // modal.toast({ message: '传到右navbar', duration: 0.3 })
      },
      onClickRightS(){
         this.$emit('naviBarRightItemClickS')
        //  const modal = weex.requireModule('modal')
        // modal.toast({ message: '传到右navbarS', duration: 0.3 })
      }
    },
    created:function(){
      var self=this;
      let Envtype = WXEnvironment.platform;
      if (Envtype !== 'Web')
      {
        var globalEvent = weex.requireModule('globalEvent') ;
        globalEvent.addEventListener("onPageInit", function (e) {
          const nav = weex.requireModule('navbar');
          nav.setTitle(self.title);
          nav.setTitleColor(self.titleColor);
          nav.setBackgroundColor(self.backgroundColor);
          if(self.navbarshow == 'hide'){
            nav.hide();
          }
          if(self.navbarshowback == 'show'){
            nav.setBack(true);
          }
          if(self.rightItemSrc!==''){
            nav.setRightImage(self.rightItemSrc,function(res){
              self.$emit('naviBarRightItemClick')
            });
          }
          if(self.rightItemTitle!==''){
            nav.setrightItemTitle(self.rightItemTitle,function(res){
              self.onClickRight()
            });
          }
        });
      }
    }
  }
</script>

<style lang="sass" scoped>
@import '../theme-default/widget/o-navbar/oc-navbar.scss'
</style>
