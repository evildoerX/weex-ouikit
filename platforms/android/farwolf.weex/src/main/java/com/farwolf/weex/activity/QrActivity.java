package com.farwolf.weex.activity;

import com.farwolf.base.FragmentBase;
import com.farwolf.base.OneFragmentActivity;
import com.farwolf.weex.fragment.QrFragment_;

import org.androidannotations.annotations.EActivity;

/**
 * Created by zhengjiangrong on 2017/4/19.
 */
@EActivity
public class QrActivity extends OneFragmentActivity{
    @Override
    public FragmentBase getFragment() {
        return new QrFragment_();
    }

    @Override
    public void init() {
          this.title.setBack();
          this.title.setTitle("二维码扫描");
    }


    @Override
    public void finish() {
        super.finish();
        overridePendingTransition(0,com.farwolf.business.R.anim.dismiss);
    }
}
