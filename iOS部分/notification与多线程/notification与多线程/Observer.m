//
//  Observer.m
//  notification与多线程
//
//  Created by 张凯泽 on 16/7/18.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "Observer.h"
#define TEST_NOTIFICATION @"TEST_NOTIFICATION"
@implementation Observer
- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _poster = [[Poster alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:TEST_NOTIFICATION object:nil];
    }
    
    return self;
}

- (void)handleNotification:(NSNotification *)notification
{
    
    NSLog(@"threadname: = %@",[NSThread currentThread]);
    NSLog(@"handle notification begin");
    sleep(4);
    NSLog(@"handle notification end");
    
    self.i = 10;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"Observer dealloc");
}
@end
