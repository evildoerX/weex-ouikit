
package com.farwolf.vshop.activity.tab;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.TabHost;
import android.widget.TextView;
import android.widget.Toast;

import com.farwolf.base.TabHostActivity;
import com.farwolf.update.UpdateService;
import com.farwolf.view.sildmenu.SlidingMenu;
import com.farwolf.vshop.R;
import com.farwolf.vshop.VSApplication;
import com.farwolf.weex.core.Page;
import com.ypy.eventbus.EventBus;

import org.androidannotations.annotations.Bean;
import org.androidannotations.annotations.EActivity;

import java.util.Calendar;

@EActivity 
public class MainActivity extends TabHostActivity {

	
	public final static String MainPage="首页";
	public final static String Classify ="分类";
	public final static String Collection ="关注";
	public final static String ShopingBus ="购物车";
	public final static String MINE="我的";
	
	SlidingMenu menu;


	@Bean
	UpdateService updateService;
 


	
	String targetName="";
 
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

//		EventBus.getDefault().register(this);
		this.AddTab(MainPage, MainPageActivity_.class);
		this.AddTab(Classify, ClassifyActivity_.class);
		this.AddTab(Collection, CollectionActivity_.class);
		this.AddTab(ShopingBus, ShopingBusActivity_.class);
		this.AddTab(MINE, MineActivity_.class);



//		updateService.init(AppInfo.APP_ID,AppInfo.UPDATE_CHECK_URL);
//		updateService.doCheck(false,false);
		getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);


//		show(Classify);
//		show(Collection);
//		show(ShopingBus);
//		show(MINE);


		show(MainPage);
	}


	@TargetApi(19)

	private static void setTranslucentStatus(Activity activity, boolean on) {

		Window win = activity.getWindow();

		WindowManager.LayoutParams winParams = win.getAttributes();

		final int bits = WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS;

		if (on) {

			winParams.flags |= bits;

		} else {

			winParams.flags &= ~bits;

		}

		win.setAttributes(winParams);

	}



//	public void onEventMainThread(ShowTabEvent event) {
//
//		show(event.name);
//	}


	@Override
	protected void AddTab(final String name, Class<?> cls) {
		View v = getItemView(name);
		v.setTag(name);
		TabHost.TabSpec tabSpec = mTabHost.newTabSpec(name);
		tabSpec.setIndicator(v);
		Intent in=new Intent(getBaseContext(), cls);
		Page p=LaunchActivity.holder.get(name);
		LaunchActivity.holder.remove(name);
		if(LaunchActivity.holder.size()==0)
			LaunchActivity.holder=null;
		in.putExtra("pageid",p.id);
		tabSpec.setContent(in);
		mTabHost.addTab(tabSpec);
		v.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				onItemClick(name);
			}
		});
	}





	@Override
	public void showTab() {
		// TODO Auto-generated method stub
		super.showTab();
		EventBus.getDefault().post("");
	 
	}
	
	long lasttime = 0;

	@Override
	public boolean dispatchKeyEvent(KeyEvent event) {

		if (event.getAction() == KeyEvent.ACTION_DOWN) {
			if (event.getKeyCode() == KeyEvent.KEYCODE_BACK) {

				return exit();
			}
		}
		return super.dispatchKeyEvent(event);
	}


	public void onResume()
	{
		super.onResume();

	}


	public void onPause()
	{
		super.onPause();

	}

	private boolean exit() {
		
		long n = Calendar.getInstance().getTime().getTime();

		if (n - lasttime < 2000) {
			System.exit(0);
		} 
		else {
			Toast.makeText(this, "在按一次退出应用", Toast.LENGTH_SHORT).show();
			lasttime = n;
		}
		return true;
	}

	@Override
	public View getItemView(String name) {
		// TODO Auto-generated method stub
		final View v = LayoutInflater.from(getBaseContext()).inflate(R.layout.tabitem_view, null);
		TextView txt = (TextView) v.findViewById(R.id.text);
		txt.setText(name);

		TextView img = (TextView) v.findViewById(R.id.img);
		Drawable drawable = getResources().getDrawable(getDrawableId(name));
		 img.setBackgroundDrawable(drawable);

		return v;
//	    return null;
	}
	
	@Override
	public void onItemClick(String name) {
		// TODO Auto-generated method stub
		
		targetName=name;
		 
		if(!VSApplication.isLogin())
		{
			if (MINE.equals(name)) {

				 return;
			}
		}
		super.onItemClick(name);
		
	}

	 

	private int getDrawableId(String name) {
		// TODO Auto-generated method stub



		if (MainPage.equals(name)) {
			return R.drawable.app_tab_main_selector;
		}
		else if (Classify.equals(name)) {
 
			return R.drawable.app_tab_main_selector;
		}

		else if (Collection.equals(name)) {
 
			return R.drawable.app_tab_main_selector;
		}
		else if (ShopingBus.equals(name)) {

			return R.drawable.app_tab_main_selector;
		}
		else if (MINE.equals(name)) {

			return R.drawable.app_tab_main_selector;
		}
		else {
			return 0;
		}
		
	
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
		EventBus.getDefault().unregister(this);
	}

	@Override
	public int getViewId() {
		// TODO Auto-generated method stub
		return R.layout.activity_tabhost;
	}

}
