package com.farwolf.weex.view;

import android.content.Context;
import android.content.Intent;
import android.util.AttributeSet;
import android.widget.Button;
import android.widget.TextView;

import com.farwolf.base.ViewBase;
import com.farwolf.util.StringUtil;
import com.farwolf.view.FreeDialog;
import com.farwolf.weex.R;
import com.farwolf.weex.activity.QrActivity_;
import com.farwolf.weex.activity.WeexActivity;
import com.farwolf.weex.pref.WeexPref_;
import com.farwolf.weex.util.HotRefreshManager;
import com.farwolf.weex.util.Weex;

import org.androidannotations.annotations.Bean;
import org.androidannotations.annotations.Click;
import org.androidannotations.annotations.EViewGroup;
import org.androidannotations.annotations.ViewById;
import org.androidannotations.annotations.sharedpreferences.Pref;

/**
 * Created by zhengjiangrong on 2017/5/8.
 */
@EViewGroup
public class ToolPop extends ViewBase{

    @Pref
    WeexPref_ pref;

    public FreeDialog f;
    @ViewById
    Button hotreload;
    @ViewById
    TextView url;


    @Bean
    Weex weex;

    public ToolPop(Context context) {
        super(context);
    }

    public ToolPop(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override
    public int getViewId() {
        return R.layout.toolpop;
    }

    @Override
    public void init() {

        WeexActivity a=(WeexActivity)getActivity();
        if(HotRefreshManager.getInstance().isOpen)
        {
            hotreload.setText("关闭热更新");

        }
        else
        {
            hotreload.setText("开启热更新");
        }
        url.setText(a.url);



    }


    public String getDebugUrl()
    {
        return  "ws://" + pref.ip().get() + ":8088/debugProxy/native";
    }


    boolean isHotReloadOpen()
    {
        WeexActivity a=(WeexActivity)getActivity();
        return !StringUtil.isNullOrEmpty(a.url)&&a.url.contains(".weex.js");
    }

    @Click
    public void hotreloadClicked() {

        WeexActivity a=(WeexActivity)getActivity();

       if( HotRefreshManager.getInstance().isOpen)
       {

//           a.url=a.url.replace("8082","8081");
           a.stopHotRefresh();
       }
       else
       {
//           a.url=a.url.replace("8081","8082");
           a.startHotRefresh();


       }
        a.render(a.url);
        f.dismiss();

    }

    @Click
    public void qrClicked() {

        f.dismiss();
        Intent in=new Intent(getActivity(), QrActivity_.class);
        getActivity().startActivityForResult(in,1);

    }

    @Click
    public void debug_reconnetcClicked() {
        weex.startDebug();
        f.dismiss();
    }

    @Click
    public void closeClicked() {

    f.dismiss();
    }
}
