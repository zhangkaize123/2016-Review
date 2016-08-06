//
//  Poster.m
//  notification与多线程
//
//  Created by 张凯泽 on 16/7/18.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//
#define TEST_NOTIFICATION @"TEST_NOTIFICATION"
#import "Poster.h"

@implementation Poster
- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self performSelectorInBackground:@selector(postNotification) withObject:nil];
    }
    
    return self;
}

- (void)postNotification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:TEST_NOTIFICATION object:nil];
}
- (void)dealloc
{
    
    NSLog(@"poster dealloc");
}
@end
