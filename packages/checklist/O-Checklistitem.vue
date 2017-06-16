<template>
  <div class="checkbox" :class="o_checkbox" @click="change">
    <div class="checkbox-content">
      <text 
        class="box" 
        :class="boxconten"></text>
      <text 
        v-if="checked" 
        class="iconbg"
        :style="iconbgColor"
        :class="iconbgconten"></text>
      <text 
        v-if="checked" 
        class="icon" 
        :class="iconconten"></text>
      <text 
        v-if="$slots.default" 
        class="text" 
        :class="textcontent">
          <slot></slot>
        </text>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    value: [Array],
    val: [String, Number, Boolean, Object, Array],
    disabled: {
      type: Boolean,
      default: false
    },
    right: Boolean,
    color: {
      default: '#09bb07'
    }
  },
  computed: {
    checked () {
      return this.value.indexOf(this.val) > -1
    },
    boxconten () {
      return [
        this.right ? 'box_right': 'box',
        this.checked ? 'box-checked' : '', 
        this.disabled ? 'box-disabled' : ''
      ]
    },
    iconconten () {
      return [
        this.right ? 'icon_right': 'icon_left',
        this.disabled ? 'icon-disabled' : ''
      ]
    },
    iconbgconten () {
      return [
        this.right ? 'iconbg_right': 'iconbg_left',
        this.disabled ? 'iconbg-disabled' : ''
      ]
    },
    iconbgColor () {
      return  this.disabled ? '' : {'background-color':this.color}
    },
    textcontent () {
      return [
        this.right ? '': 'text_left',
        this.disabled ? 'text-disabled' : ''
      ]
    },
    o_checkbox (){
      const result = []
      if (this.disabled) {
        result.push('checkbox_disabled')
      }
      return result
    }
  },
  methods: {
    change () {
      if (!this.disabled) {
        const copyed = this.value
        if (this.checked) {
          copyed.splice(this.value.indexOf(this.val), 1)
        } else {
          copyed.push(this.val)
        }
        console.log(copyed)
        this.$emit('input', copyed)
        this.$emit('change', copyed)
      }
    }
  }
}
</script>
<style lang="sass" scoped>

.checkbox {
  padding-left: 30px;
  width: 750px;
}
.checkbox:active {
  background-color: #ececec;
}
.checkbox_disabled:active {
  background-color: white;
}
.checkbox-content {
  flex-direction: row;
  align-items: center;
  border-bottom-style: solid;
  border-bottom-width: 1px;
  border-bottom-color: #D9D9D9;
  width: 720px;
  height: 87px;
}
.box{
  width: 46px;
  height: 46px;
  border-style: solid;
  border-width: 2px;
  border-color: #D9D9D9;
  border-radius: 23px;
  }
.box_right{
  position: absolute;
  right: 30px;
  top:20px;
  }

.box-disabled
{
  border-color: #D9D9D9;
}
.icon{
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
.iconbg{
  width: 46px;
  height: 46px;
  border-radius: 23px
}
.iconbg_left {
  position: absolute;
  left: 0px;
  top:20px;
}
.iconbg_right {
  position: absolute;
  right: 30px;
  top:20px;
}
.iconbg-disabled {
  border-color: #D9D9D9;
  background-color: #D9D9D9;
}
.icon_left{
  position: absolute;
  left: 10px;
  top: 32px;
}
.icon_right {
  position: absolute;
  right: 40px;
  top: 32px;
  }
.icon-disabled
{
  border-left-color: white;
  border-bottom-color: white;
  }
.text{
  color: black;
}
.text_left{
  margin-left: 25px;
}
.text-disabled
{
  color: gray;
}
</style>
