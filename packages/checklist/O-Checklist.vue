<template>
  <div append="tree">
    <ocChecklistitem
      v-for="item in checkItems"
      :key="item.index"
      :value="value"
      :val="item.val"
      :disabled="item.disabled"
      :right="item.right"
      >{{item.title}}</ocChecklistitem>
  </div>
</template>


<script>
  import ocChecklistitem from './oc-checklistitem.vue'
  export default {
    props: {
      checkItems: { 
        default: [] 
      },
      title: { 
        default: '测试' 
      },
      value: { 
        default: [] 
      },
      val: { 
        default: '' 
      },
    },
    components: {
      ocChecklistitem
    }
  }
</script>

