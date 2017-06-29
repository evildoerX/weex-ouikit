//
//  QRControl.m
//  hotjob
//
//  Created by 郑江荣 on 2017/4/17.
//  Copyright © 2017年 郑江荣. All rights reserved.
//

#import "QRControl.h"
#import "CCQrCode.h"
#import "farwolf.h"
@interface QRControl ()

@end

@implementation QRControl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CCQrCode *code = [[CCQrCode alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:code];
    
    [code startReading:^(AVCaptureOutput *captureOutput, NSArray *metadataObjects, AVCaptureConnection *connection, AVMetadataMachineReadableCodeObject *metadataObj, NSString *stringValue) {
        
        NSLog(@"%@",stringValue);
        [code stopReading];
        [self dismiss:true];
        if(self.scanSuccess!=nil)
        {
            self.scanSuccess(stringValue);
        }
        
     
    }];
}



- (IBAction)backClick:(id)sender {
    [self dismiss:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
