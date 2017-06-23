<script>
export default {
  name: 'u-select-popup',
  props: {
    maskShow: {
      type: Boolean,
      required: true
    }
  },
  data () {
    const h = this.$createElement || this.$root.$createElement
    return {
      selectComponent: null,
      options: [],
      renderFn: item => h('div', {
        on: {
          click: function (e) {
            if (!item.disabled) {
              this.selectComponent.$emit('selected', item)
              this.$emit('hide-mask')
            }
            e.stopPropagation()
          }.bind(this)
        },
        'class': [item.disabled ? 'disabled option' : 'option'] },
        [
          h('text', { 'class': ['text', item.selected ? 'text-active' : '', item.disabled ? 'text-disabled' : ''] }, item.label),
          h('text', { 'class': ['icon', item.selected ? 'icon-active' : '', item.disabled ? 'icon-disabled' : ''] })
        ]
      )
    }
  },
  watch: {
    maskShow (val) {
      if (this.selectComponent && !val && this.selectComponent.expanded) {
        this.selectComponent.collapse()
      }
    }
  },
  methods: {
    showPopup (selectComp) {
      this.selectComponent = selectComp
      const options = selectComp.data.slice()
      options.forEach(opt => {
        opt.selected = opt.value === selectComp.value
      })
      this.options = options
      if (typeof renderFn === 'function') {
        this.renderFn = selectComp.renderFn
      }
    }
  },
  render (h) {
    const $options = this.options.map(opt => this.renderFn.bind(this)(opt))
    return h('div', {
      attrs: { 'class': 'popup' }
    }, $options)
  },
  created () {
    Vue.prototype.$uSelectPopup = this
  }
}
</script>
<style lang="sass" scoped>
@import '../theme-default/widget/o-select/o-selectpopup'
</style>
