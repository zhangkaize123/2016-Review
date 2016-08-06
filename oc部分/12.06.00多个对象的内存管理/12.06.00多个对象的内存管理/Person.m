//
//  Person.m
//  12.06.00多个对象的内存管理
//
//  Created by 张凯泽 on 15/12/6.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)setBook:(Book *)book
{
    if (book != _book) {
        [_book release];
        _book = [book retain];
    }
    
}
-(void)dealloc
{
    [_book  release];
    NSLog(@"person dealloc");
    [super dealloc];
}
@end
