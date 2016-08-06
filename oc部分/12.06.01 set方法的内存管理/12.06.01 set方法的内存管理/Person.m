//
//  Person.m
//  12.06.01 set方法的内存管理
//
//  Created by 张凯泽 on 15/12/6.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)setCar:(Car*)car
{
    if (car != _car) {
        NSLog(@"1 = %ld",[car retainCount]);
        [_car release];
        NSLog(@"2 = %ld",[car retainCount]);
        _car = [car retain];
        NSLog(@"3 = %ld",[_car retainCount]);
    }
}
-(Car *)car
{
    return _car;
}
-(void)dealloc
{
    [_car release];
    [super dealloc];
}
@end
