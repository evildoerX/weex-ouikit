//
//  Weex.m
//  Pods
//
//  Created by 郑江荣 on 2017/5/4.
//
//

#import "Weex.h"
#import "WXEventModule.h"
#import <WeexSDK/WXSDKInstance.h>
#import "WXNotifyModule.h"
#import "WXPhotoModule.h"
#import "WXNetModule.h"
@implementation Weex

+(void)initWeex:(NSString*)group appName:(NSString*)appName appVersion:(NSString*)appVersion
{
    [WXAppConfiguration setAppGroup:group];
    [WXAppConfiguration setAppName:appName];
    [WXAppConfiguration setAppVersion:appVersion];
    
    [WXSDKEngine initSDKEnvironment];
    [WXSDKEngine registerModule:@"navigator" withClass:[WXNavigationModule class]];
    [WXSDKEngine registerModule:@"navbar" withClass:[WXNavBarModule class]];
    [WXSDKEngine registerModule:@"notify" withClass:[WXNotifyModule class]];
    [WXSDKEngine registerModule:@"photo" withClass:[WXPhotoModule class]];
    [WXSDKEngine registerModule:@"net" withClass:[WXNetModule class]];
    
    [WXSDKEngine registerHandler:[WXEventModule new] withProtocol:@protocol(WXEventModuleProtocol)];
    [WXSDKEngine registerHandler:[WXImgLoaderDefaultImpl new] withProtocol:@protocol(WXImgLoaderProtocol)];
    [WXSDKEngine registerComponent:@"a" withClass:[WXPushComponent class]];
//    [WXSDKEngine registerComponent:@"imageBtn" withClass:[WXImgButtonComponent class]];
    
    
    
    [WXLog setLogLevel: WXLogLevelLog];
    
}

+(void)startDebug:(NSString*)ip port:(NSString*)port
{
//     [WXDevTool setDebug:YES];
    NSString *url=[[[[@"ws://" add:ip]add:@":"]add:port]add:@"/debugProxy/native"];
    [WXDevTool launchDevToolDebugWithUrl:url];
   
}


+(NSString*)getFinalUrl:(NSString*)url weexInstance:(WXSDKInstance*)weexInstance
{
     return [NSURL URLWithString:url relativeToURL:weexInstance.scriptURL].absoluteString;
}

+(void)setImageSource:(NSString*)url compelete:(void(^)(UIImage *img))compelete
{
    if([url startWith:@"http"])
    {
        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            
      
            compelete(image);
            
        }];
    }
    else
    {
        
        NSArray *n= [url split:@"/app"];
        compelete([UIImage imageNamed:[@"app" add:n[1]]]);
    }
}




@end
