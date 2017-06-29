package com.farwolf.weex.util;


import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Base64;
import android.widget.ImageView;

import com.bumptech.glide.Glide;
import com.farwolf.util.FileTool;
import com.taobao.weex.adapter.IWXImgLoaderAdapter;
import com.taobao.weex.common.WXImageStrategy;
import com.taobao.weex.dom.WXImageQuality;

/**
 * Created by zhengjiangrong on 2017/5/7.
 */

public class ImageAdapter implements IWXImgLoaderAdapter {
    @Override
    public void setImage(String url, ImageView view, WXImageQuality quality, WXImageStrategy strategy) {

        if(url==null)
            return;
        if(url.contains("base64===")&&url.startsWith("http"))
        {
            url="base64==="+url.split("base64===")[1];
        }
        if(url.startsWith("http"))
        {

            Glide.with(((Activity)view.getContext()).getApplicationContext()).load(url).into(view);
        }
        else
        {
            if(url.startsWith("/"))
            {
                url=url.substring(1);
            }
            Bitmap bm=null;
            if(url.startsWith("base64==="))
            {
                  url=url.replace("base64===","");
                  bm= base64ToBitmap(url);
            }
            else
            {
                  bm= FileTool.loadAssetImage(url,((Activity)view.getContext()).getApplicationContext());
            }

            view.setImageBitmap(bm);
        }
    }


    public static Bitmap base64ToBitmap(String base64Data) {
        byte[] bytes = Base64.decode(base64Data, Base64.DEFAULT);
        return BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
    }
}
