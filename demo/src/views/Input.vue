<template>
  <div class="">
    <OInput type="text" class="input-item" v-model="input1" placeholder="请输入文字"></OInput>
    <OInput type="password" class="input-item" v-model="input2" placeholder="请输入密码"></OInput>
    <OInput type="url" class="input-item" v-model="input3" placeholder="请输入URL"></OInput>
    <OInput type="email" class="input-item" v-model="input4" placeholder="请输入Email"></OInput>
    <OInput type="tel" class="input-item" v-model="input5" placeholder="请输入电话号/数字"></OInput>
    <OInput type="time" class="input-item" v-model="input6" placeholder="请输入时间"></OInput>
    <OInput type="date" class="input-item" v-model="input7" placeholder="请输入日期"></OInput>
    <OInput type="text" class="input-item" v-model="input8" return-key-type="default" placeholder="调用默认键盘"></OInput>
    <OInput type="text" class="input-item" v-model="input9" return-key-type="go" placeholder="键盘标识为GO"></OInput>
    <OInput type="text" class="input-item" v-model="input10" return-key-type="next" placeholder="键盘标识为next"></OInput>
    <OInput type="text" class="input-item" v-model="input11" return-key-type="search" placeholder="键盘标识为search"></OInput>
    <OInput type="text" class="input-item" v-model="input12" return-key-type="send" placeholder="键盘标识为send"></OInput>
    <OInput type="text" class="input-item" v-model="input13" return-key-type="done" placeholder="键盘标识为done"></OInput>
    <OInput class="input-item" v-model="input14" placeholder="input something" ref="input2">
      <text slot="left_text" >手机号</text>
    </OInput>
    <OInput class="input-item" v-model="input15" placeholder="input something" ref="input2">
      <OIcon  slot="left_icon" @click="input15='';$refs.input15.focus()" size="40px" iconID="&#xe7d6;"></OIcon>
    </OInput>
    <OInput class="input-item" v-model="input16" placeholder="input something" ref="input2">
      <OIcon  slot="left_icon" @click="input16='';$refs.input16.focus()" size="40px" iconID="&#xe7d6;"></OIcon>
      <OButton slot="right" type="primary" size="small" diybutton_size btnWidth="180" plant @click="input16='';$refs.input16.focus()"  >获取验证码</OButton>
    </OInput>
  </div>
</template>
<script>
const domModule = weex.requireModule('dom')
export default {
  data () {
    return {
      input1: '',
      input2: '',
      input3: '',
      input4: '',
      input5: '',
      input6: '',
      input7: '',
      input8: '',
      input9: '',
      input10: '',
      input11: '',
      input12: '',
      input13: '',
      input14: '',
      input15: '',
      input16: ''
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
