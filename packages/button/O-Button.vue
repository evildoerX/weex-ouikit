<template>
    <text class="o-btn" :class="classes" :style="{width:`${btnWidth}px`,color:btncolor}" @click="click" @longpress="longpress">
      <slot></slot>
    </text>
</template>

<script>
  export default {

    name: 'OButton',

    props: {
      //类型：默认; 正确； 错误
      type: { default: 'default' },
      // 是否禁用
      disabled: Boolean,
      //大小：大 中  小
      size: { default: 'large' },
      //方角还是圆角，默认方角
      angle: Boolean,
      //幽灵还是非幽灵
      plant:Boolean,
      btnWidth: {
        default: ''
      },
      btncolor: {
        default: ''
      }
    },
    computed: {
      classes () {
        const result = []
        result.push(`o-btn_${this.type}`)
        result.push(`o-btn-sz_${this.size}`)
        result.push(this.plant? `o-btn-plain_${this.type}`:``)
        result.push(this.angle? `o-btn-angle_circle_${this.size}`:`o-btn-angle_square`)
        if(this.plant) {
           result.push(this.disabled ? `o-btn-plain_disabled` : ``)
        }else{
           result.push(this.disabled ? `o-btn-disabled_${this.type}` : ``)
        }
        return result
      }
    },
    methods: {
      click (e) {
        this.$emit('click', e)
      },
      longpress(e){
        this.$emit('longpress', e)
      }
    }

  }
</script>

<style lang="sass" scope>
  @import '../theme-default/widget/o-button/o-button.scss'
</style>
