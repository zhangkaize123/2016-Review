//
//  Person.m
//  12.07.01 autorelease 的用法
//
//  Created by 张凯泽 on 15/12/7.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "Person.h"

@implementation Person
+(instancetype)person
{
    return [[[self alloc]init]autorelease];
}
+(instancetype)personWithAge:(int )age
{
    return  [[self alloc]initWithInt:age];
    
}
-(instancetype)initWithAge:(int )age
{
    self = [super init];
    if (self) {
        self.age = age;
    }
    return [self autorelease];
}
- (void)dealloc
{
    //NSLog(@"-----%ld",[_age retainCount]);
    NSLog(@"person dealloc ");
    
    //NSLog(@"1-----%ld",[_age retainCount]);
    [super dealloc];
}
@end
