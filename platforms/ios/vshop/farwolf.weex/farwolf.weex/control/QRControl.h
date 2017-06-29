//
//  QRControl.h
//  hotjob
//
//  Created by 郑江荣 on 2017/4/17.
//  Copyright © 2017年 郑江荣. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^blk)(NSString*);
@interface QRControl : UIViewController
 

@property (strong,nonatomic)   blk  scanSuccess;
@end
