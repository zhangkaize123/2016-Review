//
//  ZKZPerson.m
//  block_块
//
//  Created by 张凯泽 on 16/6/22.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "ZKZPerson.h"

@implementation ZKZPerson
/*
 将Block作为参数传给dispatch_async时，系统会将Block拷贝到堆上，如果Block中使用了实例变量，还将retain self，因为dispatch_async并不知道self会在什么时候被释放，为了确保系统调度执行Block中的任务时self没有被意外释放掉，dispatch_async必须自己retain一次self，任务完成后再release self。但这里使用__block，使dispatch_async没有增加self的引用计数，这使得在系统在调度执行Block之前，self可能已被销毁，但系统并不知道这个情况，导致Block被调度执行时self已经被释放导致crash。
 */
- (void)test{
    __block ZKZPerson* weakSelf = self;
    double delayInSeconds = 10.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSLog(@"%@", weakSelf);
    });
}
@end
