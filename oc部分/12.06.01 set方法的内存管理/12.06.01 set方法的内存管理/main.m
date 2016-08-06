//
//  main.m
//  12.06.01 set方法的内存管理
//
//  Created by 张凯泽 on 15/12/6.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person * p = [[Person alloc]init];
#warning mark -zkz-- 这段代码有内存泄漏，car 无法释放,有alloc就要有release,在这里没有release方法。
        p.car = [[Car alloc]init];
       
    }
    return 0;
}
