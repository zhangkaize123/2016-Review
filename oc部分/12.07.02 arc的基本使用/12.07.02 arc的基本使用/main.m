//
//  main.m
//  12.07.02 arc的基本使用
//
//  Created by 张凯泽 on 15/12/7.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  arc 的判断准则：只要没有强指针指向对象，就会会释放对象
         */
        /**
         *  指针分两种：1.强指针  所有的指针都是强指针。
                      2.弱指针  __weak Person  * weakP
         */
        
        Person * p = [[Person alloc]init];
        Person * p2 = p;
        p2 = nil;
        p = nil;//在这里对象被销毁
        
        
        
        
    }
    return 0;
}

