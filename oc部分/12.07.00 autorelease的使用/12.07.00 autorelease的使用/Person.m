//
//  Person.m
//  12.07.00 autorelease的使用
//
//  Created by 张凯泽 on 15/12/7.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)dealloc
{
    NSLog(@"person dealloc");
    [super dealloc];
}
@end
