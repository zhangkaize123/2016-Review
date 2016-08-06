//
//  ZKZDog.m
//  block_块
//
//  Created by 张凯泽 on 16/6/22.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "ZKZDog.h"

@implementation ZKZDog
- (id)init
{
    self = [super init];
    __block id tmp = self;
    blk_ = ^{
        NSLog(@"self = %@", tmp);
        tmp = nil;
    };
    return self;
}
- (void)execBlock
{
    blk_();
}
- (void)dealloc
{
    NSLog(@"dealloc");
}
@end
