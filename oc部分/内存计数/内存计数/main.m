//
//  main.m
//  内存计数
//
//  Created by 张凯泽 on 16/7/24.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Person * p = [[[Person alloc]init] autorelease];
        
        Student * s = [[[Student alloc]init]autorelease];
        NSMutableString * string = [[[NSMutableString alloc]initWithString:@"liss"]autorelease];
        s.name = string;
        NSLog(@"%@------%p",s.name,s.name);
        [string appendString:@"xxxxx"];
         NSLog(@"%@------%p",s.name,s.name);
        /*
         如果在student name属性设置为strong类型
         2016-07-26 21:13:11.126 内存计数[61170:432980] liss------0x100203660
         2016-07-26 21:13:11.127 内存计数[61170:432980] lissxxxxx------0x100203660
         2016-07-26 21:13:11.127 内存计数[61170:432980] stuent dealloc
         因为string是可变类型，它进行改变后name属性也会进行修改。
         
         
         如果在student name属性设置为copy类型
         2016-07-26 21:14:39.204 内存计数[61262:434021] liss------0x7373696c45
         2016-07-26 21:14:39.206 内存计数[61262:434021] liss------0x7373696c45
         2016-07-26 21:14:39.206 内存计数[61262:434021] stuent dealloc
         因为string是可变类型，它进行改变后，因为name属性是copy协议所以不会改变
         */
    }
    return 0;
}
