//
//  Person.m
//  12.04.03类的多态
//
//  Created by 张凯泽 on 15/12/4.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)feeddogFood:(Dog *)dog
{
    [dog eat];
}
-(void)feedcatFood:(Cat *)cat
{
    [cat eat];
}

-(void)feedanimalFood:(Animal *)animal
{
    //在这里使用了多态，在运行的时候进行动态绑定（判断animal的类型）
    [animal eat];
}
@end
