//
//  Father.m
//  4.24面试题练习
//
//  Created by 张凯泽 on 16/4/24.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "Father.h"

@implementation Father
- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }
    return self;
}

@end
