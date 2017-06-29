package com.farwolf.weex.module;

import com.farwolf.interfac.IHttp;
import com.farwolf.volley.VolleyReq;
import com.taobao.weex.annotation.JSMethod;
import com.taobao.weex.bridge.JSCallback;
import com.taobao.weex.common.WXModule;

import java.util.HashMap;

/**
 * Created by zhengjiangrong on 2017/5/22.
 */

public class WXNetModule extends WXModule {



    public void fetch(boolean usepost, final  String url, HashMap param, HashMap header, final JSCallback start, final JSCallback success, final JSCallback compelete, final JSCallback exception)
    {

       final VolleyReq v=new VolleyReq(mWXSDKInstance.getContext()){

            @Override
            public String getUrl() {
                return url;
            }
        };
        v.addParams(param);
        v.addHeaders(header);


        v.excute(new IHttp() {
            @Override
            public void OnPostStart(Object o) {
                start.invoke(o);
            }

            @Override
            public void OnPostCompelete(Object o) {
                HashMap m=new HashMap();
                m.put("res",o);
                m.put("sessionid",v.getCookie());
                success.invoke(m);
                compelete.invoke(o);
            }

            @Override
            public void OnException(Object o) {
                 exception.invoke(o);
                compelete.invoke(o);
            }
        },usepost);




    }

    @JSMethod
    public void post(String url , HashMap param, HashMap header, final JSCallback start, final JSCallback success, final JSCallback compelete, final JSCallback exception)
    {
        this.fetch(true,url,param,header,start,success,compelete,exception);
    }

    @JSMethod
    public void get(String url , HashMap param, HashMap header, final JSCallback start, final JSCallback success, final JSCallback compelete, final JSCallback exception)
    {
        this.fetch(false,url,param,header,start,success,compelete,exception);
    }

}
