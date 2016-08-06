//
//  main.m
//  12.06.03 循环引用
//
//  Created by 张凯泽 on 15/12/6.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         当两端循环引用的时候，解决方案：
         1> ARC
         1端用strong，另1端用weak
         
         2> 非ARC
         1端用retain，另1端用assign
         */

        Person * p = [[Person alloc]init];
        Card * c = [[Card alloc]init];
        //c.name = [[NSString alloc]initWithFormat:@"%@",@"ios"];
        // arr - 1
        NSArray *arr = [[NSArray alloc]initWithObjects:@"1",@"2", nil];
        //
        //c.name = arr;
        
        //    2
        [c setName:arr];
        NSLog(@"________%ld",[arr retainCount]);
        [arr release];
        arr = nil;
        p.card = c;
        c.person = p;
        [p release];
        p = nil;
        [c release];
        c = nil;
        
    }
    return 0;
}
