//
//  main.m
//  copy与mutablecopy
//
//  Created by 张凯泽 on 16/4/20.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       //非容器类对象浅拷贝
//        NSString * s = [[NSString alloc]initWithFormat:@"%@",@"123"];
//        NSLog(@"%ld",s.retainCount);
//        NSString * ss = [s copy];
//        NSLog(@"%ld",s.retainCount);
//        NSLog(@"s= %p,ss = %p",s,ss);
        NSNumber * n = [[NSNumber alloc]initWithInt:2];
        NSLog(@"%ld",n.retainCount);
        NSString * nn = [n copy];
        NSLog(@"%ld",n.retainCount);
        NSLog(@"n= %p,nn = %p",n,nn);
    }
    return 0;
}
