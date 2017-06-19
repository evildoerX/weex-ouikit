<template>
  <div class="v-colors">
    <text class="text-block t-Primary">主要操作色：#1AAD19</text>
    <text class="text-block t-Default">次要操作色：#FFFFFF</text>
    <text class="text-block t-OColorWarn">警告类操作色：#E64340</text>
  </div>
</template>
<style lang="sass" scoped>
/**
 * text
 */

// 主标题字色
$OTextColorTitle: #000000;

//次标题字色
$OTextColorGray: #999999;

//弱提示字色
$OTextColorTips: #bfbfbf;

/**
 * line
 */

// 边框颜色
$OLineColorLight: #E5E5E5;

// 分割线颜色
$OLineColorDark: #eeeeee;

/**
 * button
 */

// 主要操作色
$OColorPrimary: #1AAD19;

// 次要操作色
$OColorDefault: white;

// 警告类操作色
$OColorWarn: #E64340;


/**
 * background
 */

// 背景底色
$OBgColorDefault: #f4f4f4;

// 弹出蒙板
$OBgColorActive: rgba(0, 0, 0, 0.4);;
.v-colors {
  padding: 20px;
}
.text-block {
  margin-top: 20px;
  margin-bottom: 20px;
  line-height: 90px;;
  border-radius: 10px;
  border-style: solid;
  border-width: 1px;
  border-color: #ccbcbc;
  text-align: center;
}
.t-Primary {
  color: #fff;
  background-color: $OColorPrimary
}
.t-Default {
  color: black;
  background-color: $OColorDefault
}
.t-OColorWarn {
  color: #fff;
  background-color: $OColorWarn
}
</style>
