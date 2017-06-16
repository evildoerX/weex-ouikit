<template>
  <div append="tree">
    <oradioitem
      v-for="item in radioItems"
      :key="item.index"
      :value="propkey"
      :val="item.val"
      @input="radiochange"
      :disabled="item.disabled"
      >{{item.title}}</oradioitem>
  </div>
</template>


<script>
  import oradioitem from './o-radioitem.vue'
  export default {
    data() {
      return {
        propkey: ''
      }
    },
    props: {
      radioItems: { 
        default: [] 
      },
      title: { 
        default: '测试' 
      },
      defaultkey: {
        default: ''
      },
      val: { 
        default: '' 
      }
    },
    components: {
      oradioitem
    },
    created () {
      this.propkey = this.defaultkey
    },
    methods: {
      radiochange (v) {
        this.propkey=v
      }
    }
  }
</script>

