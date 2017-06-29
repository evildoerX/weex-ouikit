//
//  WXNavBarModule.m
//  Pods
//
//  Created by 郑江荣 on 2017/5/5.
//
//

#import "WXNavBarModule.h"

@implementation WXNavBarModule
@synthesize weexInstance;
WX_EXPORT_METHOD(@selector(hide))
WX_EXPORT_METHOD(@selector(show))
WX_EXPORT_METHOD(@selector(setTitle:))
WX_EXPORT_METHOD(@selector(setBackgroundColor:))
WX_EXPORT_METHOD(@selector(setTitleColor:))
WX_EXPORT_METHOD(@selector(setBack:))
WX_EXPORT_METHOD(@selector(setRightText:callback:))
WX_EXPORT_METHOD(@selector(setRightImage:callback:))

-(void)hide
{
    weexInstance.viewController.navigationController.navigationBar.translucent=YES;
    [weexInstance.viewController.navigationController.navigationBar setHidden:true];
}
-(void)show
{
    weexInstance.viewController.navigationController.navigationBar.translucent=NO;
    [weexInstance.viewController.navigationController.navigationBar setHidden:false];
}
-(void)setTitle:(NSString*)s
{
    weexInstance.viewController.title=s;
}
-(void)setBackgroundColor:(NSString*)color
{
    [weexInstance.viewController.navigationController.navigationBar setBarTintColor:[color toColor]];
}
-(void)setTitleColor:(NSString*)color
{
    [weexInstance.viewController.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [color toColor]}];
}

-(void)setBack:(BOOL)back
{
    UINavigationItem *item=[[UINavigationItem alloc]init];
//   weexInstance.viewController.navigationItem.le
    UIBarButtonItem *btn=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"backwhit"] style:UIBarButtonItemStylePlain target: self   action:@selector(dismiss)];
    [btn setTintColor:[UIColor whiteColor]];
    
    
    
    if( weexInstance.viewController.navigationController.childViewControllers.count==1)
    {
        weexInstance.viewController.navigationItem.leftBarButtonItem=btn;
    }
}

-(void)dismiss
{
    [weexInstance.viewController.navigationController dismiss:true ];
}

-(void)setRightText:(NSString*)text callback:(WXModuleKeepAliveCallback)callback
{
    self.rightClickCallback=callback;
    UIBarButtonItem *btn=[[UIBarButtonItem alloc]initWithTitle:text style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    [btn setTintColor:[UIColor whiteColor]];
    weexInstance.viewController.navigationItem.rightBarButtonItem=btn;
    
}

-(void)setRightImage:(NSString*)src callback:(WXModuleKeepAliveCallback)callback
{
 
    self.rightClickCallback=callback;
    UIButton* rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,25,25)];
     src=[Weex getFinalUrl:src weexInstance:self.weexInstance];
    [Weex setImageSource:src compelete:^(UIImage *img) {
       
                  [rightButton setImage:img forState:UIControlStateNormal];
            }];
    
    [rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
     weexInstance.viewController.navigationItem.rightBarButtonItem=rightItem;
    
   
}

-(void)rightClick
{
    self.rightClickCallback(@{},true);
 
}

@end
