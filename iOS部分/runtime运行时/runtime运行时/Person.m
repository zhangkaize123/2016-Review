//
//  Person.m
//  runtime运行时
//
//  Created by 张凯泽 on 16/4/19.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person
- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _helper = [[SUTRuntimeMethodHelper alloc] init];
    }
    
    return self;
}
void functionForMethod1(id self, SEL _cmd) {
    NSLog(@"%@, %p", self, _cmd);
}

//如何该类没有这个方法系统会先调用这个方法
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"resolveInstanceMethod");
//    
//    NSString *selectorString = NSStringFromSelector(sel);
//    
//    if ([selectorString isEqualToString:@"method1"]) {
//        class_addMethod(self.class, @selector(method1), (IMP)functionForMethod1, "@:");
//    }
//    
//    return [super resolveInstanceMethod:sel];
//}
//上边的方法没有实现会调用这个方法（ 把消息转发给_helper，让他来接受消息，并进行处理）
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    
//    NSLog(@"forwardingTargetForSelector");
//    
//    NSString *selectorString = NSStringFromSelector(aSelector);
//    
//    // 将消息转发给_helper来处理
//    if ([selectorString isEqualToString:@"method2"]) {
//        return _helper;
//    }
//    
//    return [super forwardingTargetForSelector:aSelector];
//}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    
    if (!signature)
    {
        if (class_addMethod([SUTRuntimeMethodHelper class], @selector(method2), (IMP)functionForMethod1, "@:"))
        {
            if ([SUTRuntimeMethodHelper instancesRespondToSelector:aSelector])
            {
                signature = [SUTRuntimeMethodHelper instanceMethodSignatureForSelector:aSelector];
                
            }
            
        }
    }
    
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation");
    u_int count;
    Method *method = class_copyMethodList([SUTRuntimeMethodHelper class], &count);
    for (int i = 0; i < count ; i++)
    {
        SEL name = method_getName(method[i]);
        NSString *strName = [NSString stringWithCString:sel_getName(name)encoding:NSUTF8StringEncoding];
         NSLog(@"---%@",strName);
        //IMP * imp = method_getImplementation(method[i]);
        
        
    }
    free(method);
    //NSLog(@"******%@",anInvocation.methodSignature);
    if ([SUTRuntimeMethodHelper instancesRespondToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:_helper];
    }
}
//类方法
+(void)classMethod
{
    NSLog(@"this is class method");
}
//对象方法
-(void)objectMethod:(NSString *)name
{
    NSLog(@"this is objectMethod ----name = %@",name);
}
@end
