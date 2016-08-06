//
//  main.m
//  Oc中常见的错误
//
//  Created by 张凯泽 on 15/12/3.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Person :NSObject
{
    @public
    int _age;
}
@end
@implementation Person
@end

int main(int argc, const char * argv[]) {
#warning mark--zkz--1.在oc 中不能只有类的声明，而没有类的实现。
    @autoreleasepool {
        Person *p = [Person new];
        NSLog(@"%@",p);
        
        p -> _age = 10;
        NSLog(@"%d",p ->_age);
    }
    return 0;
}
