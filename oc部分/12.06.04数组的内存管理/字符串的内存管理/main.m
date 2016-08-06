//
//  main.m
//  字符串的内存管理
//
//  Created by 张凯泽 on 15/12/8.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person * p = [[Person alloc]init];
        NSArray * str = [[NSArray alloc]initWithObjects:@"ios",@"java", nil];
        
        p.name = str;
         NSLog(@"2:%ld",[str retainCount]);
        [str release];
        str = nil;
       
        [p release];
        p = nil;
        
        //[str release];
        //NSLog(@" str2 = %p",str);
        //str = nil;
    }
    return 0;
}
