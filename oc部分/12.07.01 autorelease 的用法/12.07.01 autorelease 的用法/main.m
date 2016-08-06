//
//  main.m
//  12.07.01 autorelease 的用法
//
//  Created by 张凯泽 on 15/12/7.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        
        Person * p1 = [[Person alloc]initWithAge:20];
        
    }
    return 0;
}
