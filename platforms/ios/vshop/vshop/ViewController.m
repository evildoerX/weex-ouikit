//
//  ViewController.m
//  vshop
//
//  Created by 郑江荣 on 2017/5/18.
//  Copyright © 2017年 郑江荣. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
//    NSString *s=@"http://192.168.1.105:9898/index.js";
    NSString *s=@"http://192.168.2.124:9898/index.js";
    
    self.sourceURL=[NSURL URLWithString:s];
    self.sourceURL = [[NSBundle mainBundle] URLForResource:@"app/index" withExtension:@"js"];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
