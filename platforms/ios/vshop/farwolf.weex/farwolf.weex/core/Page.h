//
//  Page.h
//  Pods
//
//  Created by 郑江荣 on 2017/6/1.
//
//

#import <Foundation/Foundation.h>
#import <WeexSDK/WXSDKInstance.h>
#import "WeexSDK/WXSDKEngine.h"
#import "WeexSDK/WXAppConfiguration.h"
#import "WeexSDK/WXLog.h"
#import "WeexSDK/WXImgLoaderProtocol.h"
#import "farwolf.h"
#import "WeexSDK/WXBaseViewController.h"
@interface Page : NSObject
@property (nonatomic, strong) WXSDKInstance *instance;
@property (nonatomic, strong) UIView *weexView;
@property (nonatomic, strong) NSURL *url;
@end
