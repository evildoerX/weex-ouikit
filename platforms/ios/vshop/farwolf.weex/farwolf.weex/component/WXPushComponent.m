//
//  WXPushComponent.m
//  farwolf.weex
//
//  Created by 郑江荣 on 2017/5/3.
//  Copyright © 2017年 郑江荣. All rights reserved.
//

#import "WXPushComponent.h"
#import "WeexFactory.h"
@implementation WXPushComponent

- (instancetype)initWithRef:(NSString *)ref type:(NSString *)type styles:(NSDictionary *)styles attributes:(NSDictionary *)attributes events:(NSArray *)events weexInstance:(WXSDKInstance *)weexInstance
{
    self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance];
    if (self) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openURL)];
        _tap.delegate = self;
        if (attributes[@"href"]) {
            _href = attributes[@"href"];
        }
    }
    return self;
}

- (void)dealloc
{
    if (_tap.delegate) {
        _tap.delegate = nil;
    }
}

- (void)viewDidLoad
{
    [self.view addGestureRecognizer:_tap];
}

- (void)openURL
{
    if (_href && [_href length] > 0) {
        /* a标签的跳转连接 可以根据该链接 进行跳转 */
    
        NSString *newURL = _href;
        if ([_href hasPrefix:@"//"]) {
            newURL = [NSString stringWithFormat:@"http:%@", _href];
        } else if (![_href hasPrefix:@"http"]) {
            newURL = [NSURL URLWithString:_href relativeToURL:self.weexInstance.scriptURL].absoluteString;
        }
      
        NSURL *url=[NSURL URLWithString:newURL];
        [WeexFactory render:url compelete:^(Page *p) {
           WXNormalViewContrller *vc=[[WXNormalViewContrller alloc]initWithSourceURL:url];
            vc.hidesBottomBarWhenPushed = YES;
            vc.page=p;
            [[self.weexInstance.viewController navigationController] pushViewController:vc animated:YES];
           
        }];
            
        
            
        
        
         
        
    
        
       
        
            
       
    }
}

- (void)updateAttributes:(NSDictionary *)attributes
{
    if (attributes[@"href"]) {
        _href = attributes[@"href"];
    }
}

#pragma mark
#pragma gesture delegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        return YES;
    }
    
    return NO;
}

@end
