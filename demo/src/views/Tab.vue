<template>
  <div class="v-tabs">
    <OTabs :value="tab1" @input="v=>tab1=v">
      <OTab label="新闻" value="news"><text>新闻。。。</text></OTab>
      <OTab label="娱乐" value="entertainment"><text>娱乐。。。</text></OTab>
      <OTab label="八卦" value="gossip"><text>八卦。。。</text></OTab>
      <OTab label="体育" value="sport"><text>体育。。。</text></OTab>
    </OTabs>
  </div>
</template>
<script>
export default {
  data () {
    return {
      tab1: 'news'
    }
  }
}
</script>
<style lang="stylus" scoped>
.v-tabs
  padding 20px
</style>
