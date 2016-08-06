//
//  main.m
//  12.05.00类的本质
//
//  Created by 张凯泽 on 15/12/5.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//
typedef struct{
    int year;
    int month;
}myDate;
#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person * p = [Person new];
        [p test:@(2)];
        
        
        //获取类的类对象
        Class cs = [Person class];
        Person * p1 = [cs new];
        [p1 test:@(3)];
        
        //函数名就是这个函数的地址
        SEL sel = @selector(test:);
        [p performSelector:sel withObject:@(43)];
        
        
        //
        Person * p2 =[Person new];
        //p2 其实就是isa的地址
        //self 指向isa  isa是指针占用8个字节
        NSLog(@"p2 = %p",p2);
        [p2 test2];
        NSLog(@"&(p2 -> _cup)= %p",&(p2 -> _cup));
        //NSLog(@"%p",&(p2 ->isa));
        
        myDate date = {2015,12};
        NSLog(@"&date = %p",&date);
        NSLog(@"%p",&(date.year));
        
        
    }
    return 0;
}
