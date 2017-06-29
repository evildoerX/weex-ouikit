package com.farwolf.vshop;

import android.app.Application;

import com.farwolf.weex.util.Weex;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;

import org.androidannotations.annotations.Bean;
import org.androidannotations.annotations.EApplication;

/**
 * Created by zhengjiangrong on 2017/5/18.
 */
@EApplication
public class VSApplication extends Application {


    @Bean
    Weex weex;

    @Override
    public void onCreate() {
        super.onCreate();
        initUnivsalImageloader();
        weex.init(this,"微聚分销","farwolf");

    }


    public static boolean isLogin()
    {
        return true;
    }


    void initUnivsalImageloader()
    {
        DisplayImageOptions defaultOptions = new DisplayImageOptions
                .Builder()
                .showImageForEmptyUri(R.drawable.bg_gf_crop_texture)
                .showImageOnFail(R.drawable.bg_gf_crop_texture)
                .cacheInMemory(true)
                .cacheOnDisc(true)
                .build();
        ImageLoaderConfiguration config = new ImageLoaderConfiguration
                .Builder(this)
                .defaultDisplayImageOptions(defaultOptions)
                .discCacheSize(50 * 1024 * 1024)//

                .writeDebugLogs()
                .build();
        com.nostra13.universalimageloader.core.ImageLoader.getInstance().init(config);
    }
}
