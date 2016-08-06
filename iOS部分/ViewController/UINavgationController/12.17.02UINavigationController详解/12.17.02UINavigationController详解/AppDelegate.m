//
//  AppDelegate.m
//  12.17.02UINavigationController详解
//
//  Created by 张凯泽 on 15/12/17.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "AppDelegate.h"
#import "ZKZOneViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

/**
 * 1. 显示在导航控制上面的永远是栈顶控制器，最后放进去的会在栈顶
   2.导航栏显示内容由栈顶控制器决定
 *
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController * nav = [[UINavigationController alloc]init];
    //nav.view .backgroundColor = [UIColor greenColor];
    
    self.window.rootViewController=nav;
    ZKZOneViewController * v1 = [[ZKZOneViewController alloc]init];
         [nav setViewControllers:[NSArray arrayWithObjects:v1, nil]];
    [self.window makeKeyAndVisible];
    //NSLog(@"%@",v1.view.superview);
    //栈顶控制器
    //nav.topViewController;
    //
   // nav pushViewController:<#(UIViewController *)#> animated:<#(BOOL)#>
    ;
    //NSLog(@"%@",nav.navigationBar);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSString * ssXml = [self digView:self.window];
    //[ssXml writeToFile:@"/Users/zkz/Desktop/2015年统一复习/代码区/iOS部分/ViewController" atomically:YES];
    BOOL b =[ssXml writeToFile:@"/Users/zkz/Documents/window.xml" atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"b = %d",b);
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
//给出一个view打印它的子控件
- (NSString *)digView:(UIView *)view
{
    if ([view isKindOfClass:[UITableViewCell class]]) return @"";
    // 1.初始化
    NSMutableString *xml = [NSMutableString string];
    
    // 2.标签开头
    [xml appendFormat:@"<%@ frame=\"%@\"", view.class, NSStringFromCGRect(view.frame)];
    if (!CGPointEqualToPoint(view.bounds.origin, CGPointZero)) {
        [xml appendFormat:@" bounds=\"%@\"", NSStringFromCGRect(view.bounds)];
    }
    
    if ([view isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scroll = (UIScrollView *)view;
        if (!UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, scroll.contentInset)) {
            [xml appendFormat:@" contentInset=\"%@\"", NSStringFromUIEdgeInsets(scroll.contentInset)];
        }
    }
    
    // 3.判断是否要结束
    if (view.subviews.count == 0) {
        [xml appendString:@" />"];
        return xml;
    } else {
        [xml appendString:@">"];
    }
    
    // 4.遍历所有的子控件
    for (UIView *child in view.subviews) {
        NSString *childXml = [self digView:child];
        [xml appendString:childXml];
    }
    
    // 5.标签结尾
    [xml appendFormat:@"</%@>", view.class];
    
    return xml;
}

@end
