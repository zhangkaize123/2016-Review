//
//  SUTRuntimeMethodHelper.m
//  runtime运行时
//
//  Created by 张凯泽 on 16/4/19.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "SUTRuntimeMethodHelper.h"
#import <objc/runtime.h>
@implementation SUTRuntimeMethodHelper
//void functionForMethod1(id self, SEL _cmd) {
//    NSLog(@"%@, %p", self, _cmd);
//}
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"resolveInstanceMethod");
//
//    NSString *selectorString = NSStringFromSelector(sel);
//
//    if ([selectorString isEqualToString:@"method2"]) {
//        class_addMethod(self.class, @selector(method2), (IMP)functionForMethod1, "@:");
//    }
//
//    return [super resolveInstanceMethod:sel];
//}
//-(void)method2
//{
//    NSLog(@"method2");
//    NSLog(@"%@, %p", self, _cmd);
//}
@end
