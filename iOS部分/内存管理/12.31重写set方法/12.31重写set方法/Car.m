//
//  Car.m
//  12.31重写set方法
//
//  Created by 张凯泽 on 15/12/31.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "Car.h"

@implementation Car
-(void)dealloc
{
    NSLog(@"Car dealloc");
    [super dealloc];
}
@end
