package com.farwolf.weex.activity;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.NonNull;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.farwolf.base.TitleActivityBase;
import com.farwolf.util.AppTool;
import com.farwolf.util.FileTool;
import com.farwolf.util.ScreenTool;
import com.farwolf.util.StringUtil;
import com.farwolf.view.FreeDialog;
import com.farwolf.view.OnMultiTouchListener;
import com.farwolf.weex.R;
import com.farwolf.weex.core.Page;
import com.farwolf.weex.core.WeexFactory;
import com.farwolf.weex.module.WXNavgationModule;
import com.farwolf.weex.pref.WeexPref_;
import com.farwolf.weex.util.Constants;
import com.farwolf.weex.util.HotRefreshManager;
import com.farwolf.weex.util.Weex;
import com.farwolf.weex.view.ToolPop;
import com.farwolf.weex.view.ToolPop_;
import com.taobao.weex.IWXRenderListener;
import com.taobao.weex.RenderContainer;
import com.taobao.weex.WXSDKInstance;
import com.taobao.weex.common.IWXDebugProxy;
import com.taobao.weex.common.WXRenderStrategy;

import org.androidannotations.annotations.AfterViews;
import org.androidannotations.annotations.Bean;
import org.androidannotations.annotations.Click;
import org.androidannotations.annotations.EActivity;
import org.androidannotations.annotations.OnActivityResult;
import org.androidannotations.annotations.ViewById;
import org.androidannotations.annotations.sharedpreferences.Pref;

import java.util.HashMap;

/**
 * Created by zhengjiangrong on 2017/5/8.
 */
@EActivity
public class WeexActivity extends TitleActivityBase implements IWXRenderListener {




    public WXSDKInstance mWXSDKInstance;
    @ViewById
    public TextView err;
    @ViewById
    public ViewGroup err_layout;
    @ViewById
    public ImageView lodingimg;
    @ViewById
    public RelativeLayout fail_layout;

    private BroadcastReceiver mReceiver;

    public boolean isRoot =false;
    @Bean
    public ScreenTool screenTool;


    public String url;

    @ViewById
    public ViewGroup container;


    private Handler mWXHandler;

    @Pref
    public WeexPref_ pref;

    @Bean
    public WeexFactory weexFactory;

    @Bean
    public Weex weex;



    public HashMap param;

    public String pageid;

    public String rootid;

    @Bean
    public AppTool apptool;



    @Override
    public int getViewId() {
        return R.layout.api_weex_activity;
    }


    public void startHotRefresh() {

        String wsUrl = "ws://" + pref.ip().get() + ":8082";
        mWXHandler.obtainMessage(Constants.HOT_REFRESH_CONNECT, 0, 0, wsUrl).sendToTarget();

    }

    public void stopHotRefresh() {

        String wsUrl = "ws://" + pref.ip().get() + ":8082";
        mWXHandler.obtainMessage(Constants.HOT_REFRESH_DISCONNECT, 0, 0, wsUrl).sendToTarget();

    }


    boolean hasInit=false;



    @AfterViews
    public void initWeexActivity()
    {
        if(hasInit)
            return;

        Glide
                .with(this)
                .load(R.drawable.load)
                .asGif()
                .diskCacheStrategy(DiskCacheStrategy.SOURCE)
                .into(lodingimg);
        hasInit=true;
        String pageid=getIntent().getStringExtra("pageid");
        this.isRoot = getIntent().getBooleanExtra("isRoot",false);
        this.param=(HashMap) getIntent().getSerializableExtra("param");
        this.rootid= getIntent().getStringExtra("rootid");
        WXNavgationModule.addActivity(this.rootid,this);
        Page page= weexFactory.getPage(pageid);
        if(page!=null)
        {
            RenderContainer c=(RenderContainer)page.v;
            container.addView(page.v);
            url=page.url;
            mWXSDKInstance= page.instance;
            pageid=page.id;
            mWXSDKInstance.setContext(this);
            mWXSDKInstance.registerRenderListener(this);
            mWXSDKInstance.onActivityCreate();
            mWXSDKInstance.fireGlobalEventCallback("onPageInit",null);
            page=null;

        }
        else
        {
            String url=getIntent().getStringExtra("url");
            render(url);
        }
        HotRefreshManager.getInstance().disConnect();
        if(mReceiver!=null)
        {
            unregisterReceiver(mReceiver);
        }



        this.container.setOnTouchListener(new OnMultiTouchListener(4){


            @Override
            public void onMultiTouch(View v, int count, MotionEvent event) {
                if(count==2)
                {
                    render(url);
                }
                else
                {
                   showTool();
                }
            }
        });


        mWXHandler=new Handler(new Handler.Callback() {
            @Override
            public boolean handleMessage(Message msg) {
                switch (msg.what) {
                    case Constants.HOT_REFRESH_CONNECT:
                        HotRefreshManager.getInstance().connect(msg.obj.toString());
                        break;
                    case Constants.HOT_REFRESH_DISCONNECT:
                        HotRefreshManager.getInstance().disConnect();
                        break;
                    case Constants.HOT_REFRESH_REFRESH:
                        render(WeexActivity.this.url);
                        break;
                    case Constants.HOT_REFRESH_CONNECT_ERROR:

                        break;
                    default:
                        break;
                }
                return false;
            }
        });
        HotRefreshManager.getInstance().setHandler(mWXHandler);
        init();
    }


    public void init(){

    }





    public void showLoading()
    {


        lodingimg.setVisibility(View.VISIBLE);
    }


    public void hideLoading()
    {

        lodingimg.setVisibility(View.GONE);
    }





    public void render(String url,boolean showProgress)
    {
        try
        {
            if(StringUtil.isNullOrEmpty(url))
                return;
            if(showProgress)
            showLoading();
            fail_layout.setVisibility(View.GONE);
            if(mWXSDKInstance!=null)
            {
                mWXSDKInstance.destroy();
            }
            this.url=url;
            mWXSDKInstance=null;
            mWXSDKInstance=new WXSDKInstance(this);
            mWXSDKInstance.setSize(screenTool.getScreenWidth(),screenTool.getScreenHeight());
            mWXSDKInstance.registerRenderListener(this);

            mWXSDKInstance.setBundleUrl(url);
            if(url.startsWith("http"))
            {
                mWXSDKInstance.renderByUrl("farwolf", url, null, null, WXRenderStrategy.APPEND_ASYNC);
            }
            else
            {
                mWXSDKInstance.render("farwolf", FileTool.loadAsset(url, this), null, null, WXRenderStrategy.APPEND_ASYNC);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            if(apptool.isDebugMode())
            {
                showError(e);
            }

        }
    }
    public void render(String url)
    {

        render(url,true);


    }
    public void showError(Exception e)
    {
        StackTraceElement[] s= e.getStackTrace();

        String msg=e+""+"\n";
        for(StackTraceElement q:s)
        {
            msg+=q.toString()+"\n";
        }

        showError( msg);
    }
    public void showError(String err)
    {
        fail_layout.setVisibility(View.VISIBLE);
        this.err.setText(err+"");
        this.err_layout.setVisibility(View.VISIBLE);
    }




    @Override
    public void onViewCreated(WXSDKInstance instance, View view) {

        container.removeAllViews();
         ViewGroup.LayoutParams lp=new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.MATCH_PARENT);
        view.setLayoutParams(lp);

        container.addView(view);

        mWXSDKInstance.fireGlobalEventCallback("onPageInit",null);
        mWXSDKInstance.onActivityCreate();
    }

    @Override
    public void onRenderSuccess(WXSDKInstance instance, int width, int height) {
        hideLoading();
    }

    @Override
    public void onRefreshSuccess(WXSDKInstance instance, int width, int height) {
        hideLoading();

    }

    @Override
    public void onException(WXSDKInstance instance, String errCode, String msg) {
        hideLoading();
        fail_layout.setVisibility(View.VISIBLE);
        if(apptool.isDebugMode())
        {
            if(!StringUtil.isNullOrEmpty(msg))
            showError(msg);
        }

    }

    private void registerBroadcastReceiver() {
        mReceiver = new RefreshBroadcastReceiver();
        IntentFilter filter = new IntentFilter();
        filter.addAction(IWXDebugProxy.ACTION_DEBUG_INSTANCE_REFRESH);
        registerReceiver(mReceiver, filter);
    }

    @Click
    public void close_errClicked() {

        this.err_layout.setVisibility(View.GONE);

    }

    @Click
    public void fail_layoutClicked() {

        render(url);

    }

    public class RefreshBroadcastReceiver extends BroadcastReceiver {
        @Override
        public void onReceive(Context context, Intent intent) {
            if (IWXDebugProxy.ACTION_DEBUG_INSTANCE_REFRESH.equals(intent.getAction())) {
                render(url);
            }
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (mWXSDKInstance != null) {
            mWXSDKInstance.onActivityDestroy();
        }

    }

    @Override
    protected void onResume() {
        super.onResume();
        if (mWXSDKInstance != null) {
            mWXSDKInstance.onActivityResume();
        }
        registerBroadcastReceiver();

        Log.e("stack",WXNavgationModule.stacks.get(rootid)+"");
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if(mWXSDKInstance!=null){
            mWXSDKInstance.onRequestPermissionsResult(requestCode,permissions,grantResults);
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if(mWXSDKInstance!=null){
            mWXSDKInstance.onActivityResult(requestCode,resultCode,data);
        }
    }



    @Override
    protected void onPause() {
        super.onPause();
        if (mWXSDKInstance != null) {
            mWXSDKInstance.onActivityPause();
        }
        if(mReceiver!=null)
        unregisterReceiver(mReceiver);

    }

    @Override
    protected void onStop() {
        super.onStop();
        if (mWXSDKInstance != null) {
            mWXSDKInstance.onActivityStop();
        }

    }


    @OnActivityResult(1)
    public void onQRRes(Intent in)
    {
        if(in==null)
            return;
        String url=in.getStringExtra("url");
        if(!StringUtil.isNullOrEmpty(url))
        {
            this.url=url;
            pref.edit().url().put(url).apply();
            render(url);
            startHotRefresh();
            weex.startDebug();
        }

    }




    @Override
    public void finish() {
        super.finish();
        WXNavgationModule.pop(this.rootid);
    }

    public void showTool()
    {

        ToolPop tool= ToolPop_.build(this);
        FreeDialog f=new FreeDialog(this,tool);
        f.setCanceledOnTouchOutside(false);
        tool.f=f;
        f.show();
    }
}
