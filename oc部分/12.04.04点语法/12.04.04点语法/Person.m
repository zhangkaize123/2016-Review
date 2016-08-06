//
//  Person.m
//  12.04.04点语法
//
//  Created by 张凯泽 on 15/12/4.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)setAge:(int)age
{
    _age = age;
}
-(void)setName:(NSString *)name
{
    _name = name;
}
-(int)age
{
    return _age;
}
-(NSString *)name
{
    return _name;
}

@end
