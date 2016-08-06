//
//  Student.m
//  内存计数
//
//  Created by 张凯泽 on 16/7/24.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "Student.h"

@implementation Student
-(void)setName:(NSMutableString *)name
{
    if (_name!=name) {
        [_name release];
        _name = [name copy];
    }
}
-(void)dealloc{
    [super dealloc];
    NSLog(@"stuent dealloc");
}
@end
