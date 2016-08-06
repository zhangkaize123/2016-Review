//
//  main.m
//  block4
//
//  Created by 张凯泽 on 16/6/22.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"
#import "Dog.h"
typedef void (^MyBlock)(id data);
int aa3 = 2000;
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         在arc状态下静态变量，全局变量所在的block为__NSGlobalBlock,而局部变量，使用__block修饰的变量所在的block为 __NSMallocBlock
         
         
         */
       // Animal * animal = [[Animal alloc]init];
        //Dog * dog = [[Dog alloc]init];
        static int aa = 1000;
        MyBlock block1 = ^(id a){
            NSLog(@"%d",aa);
        };
        NSLog(@"block1 = %@",block1);
        int aa1 = 2000;
        MyBlock block2 = ^(id a){
            NSLog(@"%d",aa1);
        };
        NSLog(@"block2 = %@",block2);
        
        MyBlock block3 = ^(id a){
            NSLog(@"%d",aa3);
        };
        NSLog(@"block3 = %@",block3);
        
        __block int aa4 = 6000;
        MyBlock block4 = ^(id a){
            NSLog(@"%d",aa4);
        };
        NSLog(@"block4 = %@",block4);
    }
    return 0;
}
