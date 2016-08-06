//
//  Person.m
//  12.31重写set方法
//
//  Created by 张凯泽 on 15/12/31.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)setCar:(Car *)car
{
    if (_car != car) {
        [_car release];
        _car = [car retain];
        //NSLog(@"_car = %p",_car);
    }
    //_car = car;
    
}
-(void)dealloc
{
    [_car release];
    NSLog(@"Person dealloc");
    [super dealloc];
}
@end
