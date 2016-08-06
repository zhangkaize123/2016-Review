//
//  main.m
//  block3
//
//  Created by 张凯泽 on 16/6/22.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZKZDog.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ZKZDog * dog = [[ZKZDog alloc]init];
        //[dog execBlock];//如果执行 execBlock 方法，就没有循环引用，如果不执行就有循环引用，挺值得玩味的
    }
    return 0;
}
