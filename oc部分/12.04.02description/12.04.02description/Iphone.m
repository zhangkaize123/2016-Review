//
//  Iphone.m
//  12.04.02description
//
//  Created by 张凯泽 on 15/12/4.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "Iphone.h"

@implementation Iphone
-(void)setCup:(int)cup
{
    _cup = cup;
}
-(void)setSize:(float)size
{
    _size = size;
}
-(int)cup
{
    return _cup;
}
-(float)size
{
    return _size;
}
//对象调用的方法
-(NSString *)description
{
    NSString * str = [NSString stringWithFormat:@"cup = %d, size = %g",[self cup],[self size]];
    return  str;
}
//类调用的方法
+(NSString*)description
{
    return @"类调用的方法";
}
@end
