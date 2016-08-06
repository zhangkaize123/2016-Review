//
//  main.m
//  12.06.02 proprity的内存管理
//
//  Created by 张凯泽 on 15/12/6.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Car * car = [[Car alloc]init];
        car.opened = YES;
        //BOOL b = car.is;
        
    }
    return 0;
}
