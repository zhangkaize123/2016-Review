//
//  Person.m
//  12.05.01properity 的使用
//
//  Created by 张凯泽 on 15/12/5.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)setAge:(int)age
{
    _age = age * 2;
}
#warning mark--zkz----
//当同时重写set和get方法的时候，proprity就不会自动给我生成成员变量
//-(int)age
//{
//    return _age;
//}

@end
