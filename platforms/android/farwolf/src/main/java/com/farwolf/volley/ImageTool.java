package com.farwolf.volley;

import org.androidannotations.annotations.EBean;
import org.androidannotations.annotations.RootContext;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.v4.util.LruCache;
import android.widget.ImageView;

import com.android.volley.RequestQueue;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.ImageLoader.ImageCache;
import com.android.volley.toolbox.ImageLoader.ImageListener;
import com.android.volley.toolbox.Volley;
import com.farwolf.libary.R;

@EBean
public class ImageTool {

	@RootContext
	protected Context context;
	
	
	
	public static ImageTool build(Context c)
	{
		ImageTool tool=new ImageTool();
		tool.context=c;
		return tool;
	}
	
	
	public void loadImage(ImageView img,String url,int defaultimgid,ImageLoader loader ){  
       
       
         
        ImageListener listener = ImageLoader.getImageListener(img, defaultimgid,R.drawable.ic_launcher);  
        loader.get(url, listener);  
    }  
}
