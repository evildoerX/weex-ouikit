//
//  TabController.m
//  vshop
//
//  Created by 郑江荣 on 2017/5/24.
//  Copyright © 2017年 郑江荣. All rights reserved.
//

#import "TabController.h"
#import "WXNormalViewContrller.h"
@interface TabController ()

@end

@implementation TabController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setSelectedIndex:1];
    
//    [self load];
 
    for(UINavigationController *n in self.viewControllers)
    {
        UIViewController *vb= n.childViewControllers[0];
        [vb viewDidLoad];
    }
//    [self.viewControllers[3] loadView];
    
//    [self loadView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)load
{
//    [self createSub:@"app/index" title:@"主页"];
     [self addChildViewController:[self createSub:@"app/index" title:@"主页" img:@"" select:@""]];
     [self addChildViewController:[self createSub:@"app/wechat" title:@"发现" img:@"" select:@""]];
     [self addChildViewController:[self createSub:@"app/photo" title:@"photo" img:@"" select:@""]];
     [self addChildViewController:[self createSub:@"app/net" title:@"网络" img:@"" select:@""]];
     [self addChildViewController:[self createSub:@"app/list" title:@"列表" img:@"" select:@""]];
}


-(UINavigationController*)createSub:(NSString*)url title:(NSString*)title img:(NSString*)img select:(NSString*)selectimg
{
    
    WXNormalViewContrller *vc=[[WXNormalViewContrller alloc]initWithSourceURL: [[NSBundle mainBundle] URLForResource:url withExtension:@"js"]];
    vc.title=title;
    vc.tabBarItem.title=title;
    vc.tabBarItem.image=[UIImage imageNamed:img];
    vc.tabBarItem.selectedImage=[UIImage imageNamed:selectimg];
    vc.hidesBottomBarWhenPushed=false;
   
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
     [vc viewDidLoad];
    return nav;
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
