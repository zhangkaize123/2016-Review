//
//  Person.m
//  字符串的内存管理
//
//  Created by 张凯泽 on 15/12/8.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "Person.h"

@implementation Person
//-(void)setName:(NSString *)name
//{
//    if (_name != name) {
//        [_name release];
//        _name = [name copy];
//    }
//}
-(void)dealloc
{
    
    //[_name release];
    //NSLog(@"_name = %p",_name );
    NSLog(@"   1:%ld",[_name retainCount]);
    [_name release];
    //NSLog(@"person dealloc");
    [super dealloc];
}
@end
