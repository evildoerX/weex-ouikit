//
//  WXNetModule.m
//  Pods
//
//  Created by 郑江荣 on 2017/5/19.
//
//

#import "WXNetModule.h"

@implementation WXNetModule
@synthesize weexInstance;
WX_EXPORT_METHOD(@selector(post:param:header:start:success:exception:compelete:))
WX_EXPORT_METHOD(@selector(get:param:header:start:success:exception:compelete:))

-(void)fetch:(BOOL)usepost url:(NSString*)url param:(NSDictionary*)param header:(NSDictionary*)header start:(WXModuleKeepAliveCallback)start exception:(WXModuleKeepAliveCallback)exception success:(WXModuleKeepAliveCallback)success compelete:(WXModuleKeepAliveCallback)compelete
{
    JsonReader *j=[JsonReader new];
    j.url=url;
    j.header=header;
    j.param=param;
    [j excuteNoLimit:^{
        start(@{},false);
    } success:^(Json *j) {
        success(@{@"res":j.data,@"sessionid":j.sessionId},false);
    } exception:^{
        exception(@{},false);
    } compelete:^{
         compelete(@{},false);
    } usePost:usepost];
}




-(void)post:(NSString*)url param:(NSDictionary*)param header:(NSDictionary*)header start:(WXModuleKeepAliveCallback)start  success:(WXModuleKeepAliveCallback)success exception:(WXModuleKeepAliveCallback)exception compelete:(WXModuleKeepAliveCallback)compelete
{
    [self fetch:true url:url param:param header:header start:start exception:exception success:success compelete:compelete];
}


-(void)get:(NSString*)url param:(NSDictionary*)param header:(NSDictionary*)header start:(WXModuleKeepAliveCallback)start  success:(WXModuleKeepAliveCallback)success exception:(WXModuleKeepAliveCallback)exception compelete:(WXModuleKeepAliveCallback)compelete
{
    [self fetch:false url:url param:param header:header start:start exception:exception success:success compelete:compelete];
}

@end
