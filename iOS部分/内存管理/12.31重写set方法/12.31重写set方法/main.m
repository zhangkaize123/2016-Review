//
//  main.m
//  12.31重写set方法
//
//  Created by 张凯泽 on 15/12/31.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person * p = [[Person alloc]init];
        Car * c = [[Car alloc]init];
        NSLog(@"1______%ld",[c retainCount]);
        c.carName = @"ios";
        p.car = c;
        NSLog(@"2______%ld",[c retainCount]);
        NSLog(@"p = %p",p);
        [p release];
        p = nil;
        //[c release];
        /*
         0x100113d50
         0x100114b40
         */
        NSLog(@"c = %p",c);
        c = nil;
        
    }
    return 0;
}
