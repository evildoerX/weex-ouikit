package com.farwolf.weex.util;

import android.app.Application;
import android.content.Context;
import android.graphics.Bitmap;
import android.widget.ImageView;

import com.bumptech.glide.Glide;
import com.farwolf.base.ServiceBase;
import com.farwolf.util.FileTool;
import com.farwolf.weex.module.WXEventModule;
import com.farwolf.weex.module.WXNavBarModule;
import com.farwolf.weex.module.WXNavgationModule;
import com.farwolf.weex.module.WXNetModule;
import com.farwolf.weex.module.WXNotifyModule;
import com.farwolf.weex.module.WXPhotoModule;
import com.farwolf.weex.pref.WeexPref_;
import com.taobao.weex.InitConfig;
import com.taobao.weex.WXEnvironment;
import com.taobao.weex.WXSDKEngine;
import com.taobao.weex.common.WXException;

import org.androidannotations.annotations.EBean;
import org.androidannotations.annotations.sharedpreferences.Pref;

/**
 * Created by zhengjiangrong on 2017/5/8.
 */
@EBean
public class Weex extends ServiceBase{



    @Pref
    WeexPref_ pref;



    public   void startDebug() {
        WXEnvironment.sDebugServerConnectable = true;
        WXEnvironment.sRemoteDebugMode = false;
        WXEnvironment.sRemoteDebugProxyUrl = getDebugUrl();
        WXSDKEngine.reload();
    }

    public   String getDebugUrl()
    {
        return  "ws://" + pref.ip().get() + ":8088/debugProxy/native";
    }



    public void init(Application application, String name, String groupname)
    {
        WXSDKEngine.addCustomOptions("appName", name);
        WXSDKEngine.addCustomOptions("appGroup", groupname);
        WXSDKEngine.initialize(application,
                new InitConfig.Builder()
                        .setImgAdapter(new ImageAdapter())
                        .build());
        try {
            WXSDKEngine.registerModule("event", WXEventModule.class);
            WXSDKEngine.registerModule("navbar", WXNavBarModule.class);
            WXSDKEngine.registerModule("navigator", WXNavgationModule.class);
            WXSDKEngine.registerModule("notify", WXNotifyModule.class);
            WXSDKEngine.registerModule("net", WXNetModule.class);
            WXSDKEngine.registerModule("photo", WXPhotoModule.class);
//            WXSDKEngine.registerComponent("switch",WXSwitch.class);
        } catch (WXException e) {
            e.printStackTrace();
        }
    }



    public static void downloadImg(String url, ImageView img, Context context)
    {

        if(url==null)
            return;
        if(url.startsWith("http"))
        {
            Glide.with(context).load(url).into(img);
        }
        else
        {
            if(url.startsWith("/"))
            {
                url=url.substring(1);
            }
            Bitmap bm= FileTool.loadAssetImage(url,context);
            img.setImageBitmap(bm);
        }
    }




}
