//
//  main.m
//  12.04.04点语法
//
//  Created by 张凯泽 on 15/12/4.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person * p = [Person new];
        p.age = 23;
        //点语法其实就是调用set方法，在编译器编译的时候自动转化成set方法。
        p.name = @"ls";
        
    }
    return 0;
}
