<template>
<!--<list class="list" @loadmore="fetch" loadmoreoffset="10">-->
  <div class="v-buttons">
    <OButton class="button-item" type="default" size="large" >default-large</OButton>
    <OButton class="button-item" type="default" size="large" disabled >default-large-disabled</OButton>

    <OButton class="button-item" type="primary" size="large" >primary-large</OButton>
    <OButton class="button-item" type="primary" size="large" disabled >primary-large-disabled</OButton>

    <OButton class="button-item" type="warn" size="large" >warn-large</OButton>
    <OButton class="button-item" type="warn" size="large" disabled >warn-large-disabled</OButton>

    <OButton class="button-item" type="default" size="middle" >default-middle</OButton>
    <OButton class="button-item" type="default" size="middle" disabled >default-middle-disabled</OButton>

    <OButton class="button-item" type="primary" size="middle" >primary-middle</OButton>
    <OButton class="button-item" type="primary" size="middle" disabled >primary-middle-disabled</OButton>

    <OButton class="button-item" type="warn" size="middle" >warn-middle</OButton>
    <OButton class="button-item" type="warn" size="middle" disabled >warn-middle-disabled</OButton>
    <OButton class="button-item" type="default" size="small" >DS</OButton>
    <OButton class="button-item" type="default" size="small" disabled >DSD</OButton>

    <OButton class="button-item" type="primary" size="small" >PS</OButton>
    <OButton class="button-item" type="primary" size="small" disabled >PSD</OButton>

    <OButton class="button-item" type="warn" size="small" >WS</OButton>
    <OButton class="button-item" type="warn" size="small" disabled >WSD</OButton>


    <OButton class="button-item" type="link" size="small" >link</OButton>

    <OButton class="button-item" type="default" size="large" plant >default-large</OButton>

    <OButton class="button-item" type="primary" size="large" plant>primary-large</OButton>

    <OButton class="button-item" type="warn" size="large" plant>warn-large</OButton>

    <OButton class="button-item" type="warn" size="large" plant disabled >plant-disabled</OButton>

    <OButton class="button-item" type="default" size="middle" plant >default-middle</OButton>

    <OButton class="button-item" type="primary" size="middle" plant >primary-middle</OButton>

    <OButton class="button-item" type="warn" size="middle" plant >warn-middle</OButton>

    <OButton class="button-item" type="default" size="small" plant >DS</OButton>

    <OButton class="button-item" type="primary" size="small" plant >PS</OButton>

    <OButton class="button-item" type="warn" size="small" plant >WS</OButton>
  </div>
<!--</list>-->
</template>
<script>
const LOADMORE_COUNT = 4
export default {
  methods: {
    fetch (event) {
      modal.toast({ message: 'loadmore', duration: 1 })

      setTimeout(() => {
        const length = this.lists.length
        for (let i = length; i < length + LOADMORE_COUNT; ++i) {
          this.lists.push(i + 1)
        }
      }, 800)
    }
  }
}
</script>
<style lang="sass" scoped>
.v-buttons{
  justify-content:center;
  align-items: center;
}
.button-item{
  margin-top: 20px;
  margin-bottom: 20px;
}
</style>
