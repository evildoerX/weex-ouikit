<template>
  <div class="container" :style="{ backgroundColor: backgroundColor }" @click="onclickitem">
    <CIcon v-if="tabicon"
      size="54"
      :color="iconcolor"
      :iconID="tabicon"></CIcon>
    <image
      v-if="iconimage"
      class="tab-icon"
      :src="iconimage"></image>
    <text class="tab-text" :style="{ color: titleColor }">{{label}}</text>
  </div>
</template>

<script>
  import CIcon  from '../icon/C-Icon.vue'
  export default {
    name: 'OWTabbarItem',
    props: {
      index: {
        default: 0
      },
      label: {
        default: ''
      },
      titleColor: {
        default: ''
      },
      iconcolor: {
        default: ''
      },
      iconimage: {
        default: ''
      },
      backgroundColor: {
        default: '#ffffff'
      },
      tabicon: {
        default: '&#xe7d5'
      }
    },
    methods: {
      onclickitem (e) {
        this.$emit('tabItemOnClick', {
          index: this.index
        })
      }
    }
  }
</script>

<style>
  .container {
    flex: 1;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 108px;
  }

  .tab-icon {
    width: 54px;
    height: 54px;
    margin-bottom: 5px;
  }

  .tab-text {
    text-align: center;
    font-size: 20px;
  }
</style>
