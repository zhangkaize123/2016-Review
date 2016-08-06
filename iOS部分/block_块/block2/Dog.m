//
//  Dog.m
//  block_块
//
//  Created by 张凯泽 on 16/6/22.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "Dog.h"

@implementation Dog
-(void)say
{
    NSLog(@"🐶在叫");
}
- (void)test{
    __block Dog* weakSelf = self;
    double delayInSeconds = 10.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSLog(@"%@", weakSelf);
    });
}
@end
