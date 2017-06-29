//
//  WXNavigationModule.m
//  farwolf.weex
//
//  Created by 郑江荣 on 2017/5/3.
//  Copyright © 2017年 郑江荣. All rights reserved.
//

#import "WXNavigationModule.h"

@implementation WXNavigationModule
@synthesize weexInstance;
WX_EXPORT_METHOD(@selector(push:))
WX_EXPORT_METHOD(@selector(pushParam:param:))
WX_EXPORT_METHOD(@selector(pushFull:param:callback:animated:))
WX_EXPORT_METHOD(@selector(back))
WX_EXPORT_METHOD(@selector(backFull:animated:))
WX_EXPORT_METHOD(@selector(presentFull:param:createNav:callback:animated:))
WX_EXPORT_METHOD(@selector(present:))
WX_EXPORT_METHOD(@selector(dismiss))
WX_EXPORT_METHOD(@selector(dismissFull:animated:))
WX_EXPORT_METHOD(@selector(backTo:))
WX_EXPORT_METHOD(@selector(setPageId:))
WX_EXPORT_METHOD_SYNC(@selector(param))
WX_EXPORT_METHOD(@selector(setRoot:))

-(void)push:(NSString *)url
{
    [self pushFull:url param:nil callback:nil animated:true];
}
-(void)pushParam:(NSString *)url param:(NSDictionary*)param
{
    [self pushFull:url param:param callback:nil animated:true];
}
-(void)pushFull:(NSString *)url param:(NSDictionary*)param callback:(WXModuleKeepAliveCallback)callback animated:(BOOL)animated
{
    NSString *newURL = url;
    if ([url hasPrefix:@"//"]) {
        newURL = [NSString stringWithFormat:@"http:%@", url];
    } else if (![url hasPrefix:@"http"]) {
        newURL = [NSURL URLWithString:url relativeToURL:weexInstance.scriptURL].absoluteString;
    }
    WXNormalViewContrller *vc=[WXNormalViewContrller new];
    vc.sourceURL=[NSURL URLWithString:newURL];
    vc.param=param;
    vc.callback=callback;
    [[weexInstance.viewController navigationController] pushViewController:vc animated:animated];
}

-(id)param
{
    WXNormalViewContrller *vc=weexInstance.viewController;
    return vc.param;
}

-(void)setPageId:(NSString*)pid
{
    WXNormalViewContrller *vc=weexInstance.viewController;
    vc.pageid=pid;
}

-(void)backFull:(NSDictionary*)param animated:(BOOL)animated
{
    WXNormalViewContrller *vc=  weexInstance.viewController;
    if(vc.callback!=nil)
    vc.callback(param, false);
    [vc back:animated];
}
-(void)backTo:(NSString*)pageid
{
    WXNormalViewContrller *vc=  weexInstance.viewController;
    NSArray *n=vc.navigationController.viewControllers;
    WXNormalViewContrller *tvc=nil;
    for (WXNormalViewContrller* v in n) {
       
        if([pageid isEqualToString:v.pageid])
        {
            tvc=v;
        }
    }
    if(tvc!=nil)
    [vc.navigationController popToViewController:tvc animated:true];
    
}

-(void)back
{
    [self backFull:nil animated:true];
}

-(void)present:(NSString *)url
{
    [self presentFull:url param:nil createNav:true callback:nil animated:true];
}

-(void)presentFull:(NSString *)url param:(NSDictionary*)param createNav:(BOOL)createNav callback:(WXModuleKeepAliveCallback)callback animated:(BOOL)animated
{
    NSString *newURL = url;
    if ([url hasPrefix:@"//"]) {
        newURL = [NSString stringWithFormat:@"http:%@", url];
    } else if (![url hasPrefix:@"http"]) {
        newURL = [NSURL URLWithString:url relativeToURL:weexInstance.scriptURL].absoluteString;
    }
    WXNormalViewContrller *vc=[WXNormalViewContrller new];
    vc.param=param;
    vc.sourceURL=[NSURL URLWithString:newURL];
    vc.callback=callback;
    
    if(createNav)
    {
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
        [weexInstance.viewController presentViewController:nav animated:animated completion:^{
            
        }];
        return;
    }
    
    [weexInstance.viewController presentViewController:vc animated:animated completion:^{
    }];
 
}


-(void)dismiss
{
    [self dismissFull:nil animated:true];
}
-(void)setRoot:(NSString*)rootid
{
    
}
-(void)dismissFull:(NSDictionary*)param animated:(BOOL)animated
{
    
    WXNormalViewContrller *vc= weexInstance.viewController;
    if(vc.callback!=nil)
    vc.callback(param, false);
    if(vc.navigationController!=nil)
    {
        [vc.navigationController dismiss:animated];
    }
    else
    [vc dismiss:animated];
}


@end
