package com.farwolf.vshop.activity.tab;

import com.farwolf.weex.activity.WeexActivity;

import org.androidannotations.annotations.EActivity;

/**
 * Created by zhengjiangrong on 2017/5/23.
 */
@EActivity
public class CollectionActivity  extends WeexActivity {


    @Override
    public void init() {
        this.title.setTitle("关注");
//        render("wechat.js",false);
    }
}
