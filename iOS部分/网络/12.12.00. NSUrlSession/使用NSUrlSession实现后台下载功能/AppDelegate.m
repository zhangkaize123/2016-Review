//
//  AppDelegate.m
//  使用NSUrlSession实现后台下载功能
//
//  Created by 张凯泽 on 16/3/10.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
void (^dd)()=^(){
    
};
//使用后台下载代理方法
-(void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler
{
    completionHandler = ^(){NSLog(@"sssss");};
    //self.backgroundTransferCompletionHandler = completionHandler;
    self.backgroundTransferCompletionHandler = completionHandler;
    NSLog(@"appp");
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    return YES;
}


@end
