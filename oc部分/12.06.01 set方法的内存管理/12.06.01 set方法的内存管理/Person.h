//
//  Person.h
//  12.06.01 set方法的内存管理
//
//  Created by 张凯泽 on 15/12/6.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
@interface Person : NSObject
{
    Car * _car;
}
-(void)setCar:(Car*)car;
-(Car *)car;

@end
