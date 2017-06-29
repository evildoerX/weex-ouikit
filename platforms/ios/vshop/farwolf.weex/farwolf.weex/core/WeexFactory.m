//
//  WeexFactory.m
//  Pods
//
//  Created by 郑江荣 on 2017/6/1.
//
//

#import "WeexFactory.h"

@implementation WeexFactory


+ (void)render:(NSURL *)sourceURL compelete:(void(^)(Page*))complete
{
 
    Page *p=[Page new];
    p.instance = [[WXSDKInstance alloc] init];
    p.instance.frame = CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    p.instance.pageObject = self;
    NSString *newURL = nil;
    
    if ([sourceURL.absoluteString rangeOfString:@"?"].location != NSNotFound) {
        newURL = [NSString stringWithFormat:@"%@&random=%d", sourceURL.absoluteString, arc4random()];
    } else {
        newURL = [NSString stringWithFormat:@"%@?random=%d", sourceURL.absoluteString, arc4random()];
    }
    [p.instance renderWithURL:[NSURL URLWithString:newURL] options:@{@"bundleUrl":sourceURL.absoluteString} data:nil];
    
//    __weak typeof(p) weakP= p;
//    __weak __typeof__(p) weakP = p;
        __strong __typeof(p) weakP = p;
    p.instance.onCreate = ^(UIView *view) {
 
        weakP.weexView=view;
        complete(weakP);
    
    };
    
    
    p.instance.onFailed = ^(NSError *error) {
        
        NSString *msg=error.userInfo[@"NSLocalizedDescription"];
        NSLog(@"%@", msg);
    
    };
    
    
    p.instance.renderFinish = ^(UIView *view) {
//        [weakSelf _updateInstanceState:WeexInstanceAppear];
//        [_instance fireGlobalEvent:@"onPageInit" params:nil];
        
    };
 
    
}

@end
