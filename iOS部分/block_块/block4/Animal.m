//
//  Animal.m
//  block_块
//
//  Created by 张凯泽 on 16/6/22.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "Animal.h"

@implementation Animal
-(instancetype)init
{
    self = [super init];
    if (self) {
        _dog = [[Dog alloc]init];
    }
    return self;
}
-(void)dealloc
{
    NSLog(@"animal dealloc");
}
@end
