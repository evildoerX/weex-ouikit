<template>
  <div class="">
    <OInput class="input-item" v-model="input1" placeholder="请输入"></OInput>
    <OInput class="input-item" v-model="input2" placeholder="input something" ref="input2">
      <text slot="left_text" >手机号</text>
      <OIcon v-if="!!input2" slot="right" @click="input2='';$refs.input2.focus()" size="20px">&#xe645;</OIcon>
    </OInput>
    <OInput class="input-item" v-model="input2" placeholder="input something" ref="input2">
      <OIcon  slot="left_icon" @click="input2='';$refs.input2.focus()" size="40px" iconID="&#xe7d6;"></OIcon>
    </OInput>
    <OInput class="input-item" v-model="input2" placeholder="input something" ref="input2">
      <OIcon  slot="left_icon" @click="input2='';$refs.input2.focus()" size="40px" iconID="&#xe7d6;"></OIcon>
      <OButton slot="right" type="primary" size="small" btnWidth="180" plant  >获取验证码</OButton>
    </OInput>
  </div>
</template>
<script>
const domModule = weex.requireModule('dom')
export default {
  data () {
    return {
      input1: '',
      input2: ''
    }
  },
  created () {
    domModule.addRule('fontFace', {
      'fontFamily': 'inputfont',
      'src': "url('//at.alicdn.com/t/font_1uf08qmz45tgldi.ttf')"
    })
  }
}
</script>
<style lang="stylus" scoped>
.input-item
  margin-top 20px
  margin-bottom 20px
</style>
