//
//  main.m
//  12.05.01properity 的使用
//
//  Created by 张凯泽 on 15/12/5.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student * ss = [[Student alloc]init];
        ss.age = 67;
        NSLog(@"%d",ss.age);
    }
    return 0;
}
