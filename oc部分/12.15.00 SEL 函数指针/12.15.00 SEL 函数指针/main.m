//
//  main.m
//  12.15.00 SEL 函数指针
//
//  Created by 张凯泽 on 15/12/15.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person * p = [[Person alloc]init];
        Class class = NSClassFromString(@"Person");
        id pp = [[class alloc]init];
        ((Person *)pp).name = @"java";
        p.name = @"ios";
        SEL sel = @selector(say:);
        [(Person*)pp performSelector:sel withObject:((Person*)pp).name];
        
    }
    return 0;
}
