package com.farwolf.vshop.activity.tab;

import com.farwolf.weex.activity.WeexActivity;

import org.androidannotations.annotations.EActivity;

/**
 * Created by zhengjiangrong on 2017/5/23.
 */
@EActivity
public class ClassifyActivity extends WeexActivity {

    @Override
    public void init() {
        this.title.setTitle("分类");
//        render("list.js",false);
    }
}
