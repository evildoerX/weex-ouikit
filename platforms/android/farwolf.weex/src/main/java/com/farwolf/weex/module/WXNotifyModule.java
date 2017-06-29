package com.farwolf.weex.module;

import com.farwolf.weex.util.Event;
import com.taobao.weex.annotation.JSMethod;
import com.taobao.weex.bridge.JSCallback;
import com.taobao.weex.common.WXModule;
import com.ypy.eventbus.EventBus;

import java.util.HashMap;

/**
 * Created by zhengjiangrong on 2017/5/18.
 */

public class WXNotifyModule  extends WXModule {




    public HashMap<String,JSCallback>callbacks=new HashMap<>();


    @JSMethod
    public void regist(String key,JSCallback callback)
    {
        if(!EventBus.getDefault().isRegistered(this))
            EventBus.getDefault().register(this);
        callbacks.put(key,callback);
    }





    @JSMethod
    public void send(String key,HashMap param)
    {
        EventBus.getDefault().post(new Event(key,param));
    }




    @Override
    public void onActivityDestroy() {
        super.onActivityDestroy();
        EventBus.getDefault().unregister(this);
        callbacks.clear();
        callbacks=null;
    }

    public void onEventMainThread(Event event) {

        JSCallback callback=  callbacks.get(event.key);
        if(callback!=null)
        callback.invokeAndKeepAlive(event.param);


    }


}
