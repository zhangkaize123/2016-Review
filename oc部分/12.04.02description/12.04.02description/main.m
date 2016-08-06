//
//  main.m
//  12.04.02description
//
//  Created by 张凯泽 on 15/12/4.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Iphone.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Iphone * ip = [Iphone new];
        [ip setCup:4];
        [ip setSize:4.7];
        NSLog(@"%@",ip);
        //获取类名方法1.
        Class ccs = NSClassFromString(@"Iphone");
        //方法2
        //Class cs = [ip class];
        NSLog(@"%@",ccs);
    }
    return 0;
}
