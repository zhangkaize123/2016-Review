//
//  Card.m
//  12.06.03 循环引用
//
//  Created by 张凯泽 on 15/12/6.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "Card.h"
#import "Person.h"
@implementation Card
-(void)setName:(NSArray*)name
{
    //_name = name;
    if (_name != name) {
        [_name release];
        _name = [name retain];
    }
}
-(NSArray *)name
{
    return _name;
}
- (void)dealloc
{
    [_person release];
    NSLog(@"1 = %ld",[_name retainCount]);
    [_name release];
    //NSLog(@"2 = %ld",[_name retainCount]);
//    if ([_name retainCount] >0) {
//        NSLog(@"2 = %ld",[_name retainCount]);
//    }else{
//        NSLog(@"arr dealloc");
//    }
    
    NSLog(@"card dealloc");
    [super dealloc];
}
@end
