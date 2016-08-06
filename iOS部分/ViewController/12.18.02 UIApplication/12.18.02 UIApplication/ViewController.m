//
//  ViewController.m
//  12.18.02 UIApplication
//
//  Created by 张凯泽 on 15/12/18.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)ClickTap;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//是否显示状态栏 YES为不显示
//-(BOOL)prefersStatusBarHidden
//{
//    return YES;
//}
//状态栏样式
//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;//字体为白色
//    
//}

- (IBAction)ClickTap {
    UIApplication * app = [UIApplication sharedApplication];
    //1.bageValue
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version >= 8.0) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        app.applicationIconBadgeNumber=10;
    }else
    {
        app.applicationIconBadgeNumber=10;
    }
    //清除bageValue 使它等于app.applicationIconBadgeNumber=0
    //2.显示网络状态
   // app.networkActivityIndicatorVisible = YES;
    //打电话
    //发邮件
    //3.状态栏 在配置文件里View controller-based status bar appearance设置为no
    //View controller-based status bar appearance
    //[app setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    [app setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
   // app.statusBarStyle = UIStatusBarStyleDefault;
    
    

}
@end
