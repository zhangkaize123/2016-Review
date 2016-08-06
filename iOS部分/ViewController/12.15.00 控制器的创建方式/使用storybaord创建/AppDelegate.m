//
//  AppDelegate.m
//  使用storybaord创建
//
//  Created by 张凯泽 on 15/12/15.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "AppDelegate.h"
#import "ZKZViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    self.window.backgroundColor = [UIColor whiteColor];
    //创建控件器
    //使用storyboard创建
    NSBundle * bundle = [NSBundle mainBundle];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"two" bundle:bundle];
    //加载storyboard中箭头指向的控制器
    //UIViewController *controler = [storyboard instantiateInitialViewController];
    //加载storyboard文件中带有标示的控制器
    ZKZViewController *controler =[storyboard instantiateViewControllerWithIdentifier:@"blueId"];
    self.window.rootViewController = controler;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
