//
//  WeexFactory.h
//  Pods
//
//  Created by 郑江荣 on 2017/6/1.
//
//

#import <Foundation/Foundation.h>
#import "Page.h"
@interface WeexFactory : NSObject
+ (void)render:(NSURL *)sourceURL compelete:(void(^)(Page*))complete;
@end
