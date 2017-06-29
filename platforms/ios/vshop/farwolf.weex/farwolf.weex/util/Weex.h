//
//  Weex.h
//  Pods
//
//  Created by 郑江荣 on 2017/5/4.
//
//

#import <Foundation/Foundation.h>
#import "farwolf_weex.h"
@interface Weex : NSObject
+(void)initWeex:(NSString*)group appName:(NSString*)appName appVersion:(NSString*)appVersion;
+(void)startDebug:(NSString*)ip port:(NSString*)port;
+(void)setImageSource:(NSString*)url compelete:(void(^)(UIImage *img))compelete;
+(NSString*)getFinalUrl:(NSString*)url weexInstance:(WXSDKInstance*)weexInstance;
@end
