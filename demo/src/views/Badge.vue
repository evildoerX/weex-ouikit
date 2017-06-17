<template>
  <div class="v-badges">
    <div class="row">
      <div class="cell">
        <OBadge count="99+">
          <OIcon iconID="&#xe7d5;"></OIcon>
        </OBadge>
      </div>
      <div class="cell">
        <OBadge :count="9">
          <OIcon iconID="&#xe7d6;"></OIcon>
        </OBadge>
      </div>
      <div class="cell">
        <OBadge dot>
          <text class="text">新闻</text>
        </OBadge>
      </div>
      <div class="cell">
        <OBadge :count="count1">
          <text class="text" @click="() => count1 = count1 > 0 ? count1 - 1 : 0">点击后减少</text>
        </OBadge>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data () {
    return {
      count1: 10
    }
  }
}
</script>
<style lang="stylus" scoped>
.v-badges
  padding 20px
.row
  flex-direction row
  margin-top 20px
  margin-bottom 20px
.cell
  flex 1
  flex-direction row
  justify-content center
.text
  font-size 28px
  color #667180
</style>
