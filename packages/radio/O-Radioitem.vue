<template>
  <div class="radio" :class="c_radio" @click="change">
    <div class="radiocontent">
      <div class="icon" :class="c_iconbg">
        <div :class="c_icon"></div>
      </div>
      <text v-if="$slots.default" class="text" :class="[disabled?'text-disabled':'']"><slot></slot></text>
    </div>
  </div>
</template>
<script>
export default {
  name: 'o-radio',
  props: {
    value: [String, Number, Boolean, Object, Array],
    val: [String, Number, Boolean, Object, Array],
    disabled: {
      type: Boolean,
      default: false
    }
  },
  computed: {
    c_iconbg () {
      const result = []
      const checked = this.val === this.value
      console.log(checked, this.val)
      if (checked) {
        result.push('checked')
      }
      if (this.disabled) {
        result.push('disabled')
      }
      return result
    },
    c_icon (){
      const result = []
      const checked = this.val === this.value
      if (checked) {
        result.push('checkicon')
      }
      return result
    },
    c_radio (){
      const result = []
      if (this.disabled) {
        result.push('radio_disabled')
      }
      return result
    }
  },
  methods: {
    change () {
      if (!this.disabled) {
        this.$emit('input', this.val)
        this.$emit('change', this.val)
      }
    }
  }
}
</script>
<style lang="sass" scoped>
.radio{
  padding-left: 30px;
  width: 750px;
}
.radiocontent {
  flex-direction: row;
  align-items: center;
  border-bottom-style: solid;
  border-bottom-width: 1px;
  border-bottom-color: #D9D9D9;
  width: 720px;
  height: 87px;
}
.radio:active {
  background-color: #ececec;
}
.radio_disabled:active{
  background-color:white;
}
.icon{
  width: 46px;
  height: 46px;
  border-radius: 23px;
  border-width: 2px;
  border-color:#c9c9c9;
  border-style: solid;
}
.checkicon {
  position:absolute;
  top:10px;
  left: 8px;
  width: 24px;
  height: 14px;
  border-left-style: solid;
  border-left-width: 3px;
  border-left-color: white;
  border-bottom-style: solid;
  border-bottom-width: 3px;
  border-bottom-color: white;
  border-radius: 2px;
  transform: rotate(-45deg);
}
.checkicon:active{
  color:#ececec;
}
.checked{
  border-radius: 23px;
  border-width: 2px;
  border-color:#09bb07;
  border-style: solid;
  background-color:#09bb07 
}


.text{
  margin-left: 25px;
}
.text-disabled{
  color: gray;
}
</style>
