//
//  Person.h
//  12.06.02 proprity的内存管理
//
//  Created by 张凯泽 on 15/12/6.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
@interface Person : NSObject
#warning mark ---zkz 这种格式的property的set方法是这种格式
/*
 -(void)setCar:(Car *)car
 {
 _car = car;
 }
 */
@property Car * car;//
#warning mark -zkz - 这种格式的property的set方法是这种格式
/*
 {
 if (_car != car) {
    [_car release];
     _car = [car retain];
 }
 
 }
 */
@property(nonatomic,strong)Car *car1;

@end
