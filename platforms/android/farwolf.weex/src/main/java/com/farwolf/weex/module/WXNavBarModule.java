package com.farwolf.weex.module;

import android.graphics.Color;
import android.view.View;

import com.farwolf.util.StringUtil;
import com.farwolf.weex.base.WXModuleBase;
import com.farwolf.weex.util.Weex;
import com.taobao.weex.annotation.JSMethod;
import com.taobao.weex.bridge.JSCallback;

/**
 * Created by zhengjiangrong on 2017/5/10.
 */

public class WXNavBarModule extends WXModuleBase {



    @JSMethod
    public void setTitle(String title)
    {

         if(getTitleBar()!=null)
         getTitleBar().setTitle(title);
    }

    @JSMethod
    public void setTitleColor(String color)
    {
        if(getTitleBar()!=null)
        getTitleBar().title.setTextColor(Color.parseColor(color));
    }

    @JSMethod
    public void setBack(boolean back)
    {
        if(getTitleBar()==null)
            return;
           if(back)
           {
               getTitleBar().setBack();
           }
           else
           {
               getTitleBar().leftview.setVisibility(View.GONE);

           }
    }

    @JSMethod
    public void hide()
    {
        if(getTitleBar()==null)
            return;
        getTitleBar().setVisibility(View.GONE);
    }


    @JSMethod
    public void show()
    {
        if(getTitleBar()==null)
            return;
        getTitleBar().setVisibility(View.VISIBLE);
    }

    @JSMethod
    public void setBackgroundColor(String color)
    {
        if(getTitleBar()==null)
            return;
        getTitleBar().layout.setBackgroundColor(Color.parseColor(color));
    }

    @JSMethod
    public void setRightText(String text,final JSCallback callback)
    {
        getTitleBar().setRightText(text);
        getTitleBar().setRightClick(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                callback.invokeAndKeepAlive(null);
            }
        });
    }

    @JSMethod
    public void setLeftText(String text)
    {
        if(getTitleBar()==null)
            return;
        getTitleBar().setLeftText(text);
    }

    @JSMethod
    public void setRightImage(String src,final JSCallback callback)
    {
        if(getTitleBar()==null)
            return;
        getTitleBar().rightview.setVisibility(View.VISIBLE);
        getTitleBar().right_image.setVisibility(View.VISIBLE);
        getTitleBar().setRightClick(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                callback.invokeAndKeepAlive(null);
            }
        });
        src=StringUtil.getRealUrl(this.mWXSDKInstance.getBundleUrl(),src);

        Weex.downloadImg(src, getTitleBar().right_image,this.mWXSDKInstance.getContext());
    }

}
