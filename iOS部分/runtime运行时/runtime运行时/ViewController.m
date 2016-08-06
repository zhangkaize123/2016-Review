//
//  ViewController.m
//  runtime运行时
//
//  Created by 张凯泽 on 16/4/19.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
//void functionForMethod1(id self, SEL _cmd) {
//    NSLog(@"%@, %p", self, _cmd);
//    NSLog(@"this is objectmethod");
//}
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person * p = [[Person alloc]init];
   // Person * pp = [p copy];
    //NSLog(@"p = %p,pp= %p",p,pp);
#pragma mark---zkz--消息转发机制
  //SEL sel = sel_registerName("method2");
//    //使用 [p performSelector:sel] 会产生⚠警告所以使用imp 指针来实现
 //[p performSelector:sel];
   // IMP imp = [p methodForSelector:sel];
//    void (* func)(id ,SEL) = (void*)imp;
//    func(p,sel);
    
    //对于不可变的对象如nsstring,nsnumber使用copy不会产生新的对象，如何使用mutablecopy才能产生新的对象
  // NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    //NSLog(@"bundleIdentifier = %@",bundleIdentifier);
 #pragma mark---zkz--如何通过一个selector找到对应的IMP指针（考虑类方法与对象方法）
    SEL classMethod = sel_registerName("classMethod");
    //获取类IMP指针方法1
    //IMP classIMP = [Person methodForSelector:classMethod];
    Method classMethod1 = class_getClassMethod([Person class], classMethod);
    //获取类IMP指针方法2
    IMP classIMP = method_getImplementation(classMethod1);
    void(* classmethod)(Class,SEL) = (void*)classIMP;
    classmethod([Person class] ,classMethod);
    
//    class_getClassMethod, class_getClassVariable, class_getInstanceMethod, class_getInstanceVariable, class_getMethodImplementation
//    
    
    
  
    SEL objectMethod = sel_registerName("objectMethod:");
    
    //IMP objectIMP = [p methodForSelector:objectMethod];
    //IMP objectIMP2 = [Person instanceMethodForSelector:objectMethod];
    IMP objectIMP3 = class_getMethodImplementation([Person class], objectMethod);

    void (*objectmethod)(id,SEL,id) = (void*)objectIMP3;
    objectmethod(p,objectmethod,@"ios");
#pragma mark---zkz-----一些方法与
    //method_getName, method_getImplementation, method_getReturnType
    //objectmethod
    //    Method method = class_getClassMethod([Person class], <#SEL name#>)
    //method_setImplementation和method_exchangeImplementations
    //获取类对象的方法列表
    unsigned int outCount = 0;
    Method *methods11 = class_copyMethodList([Person class], &outCount);
    for (int i = 0; i < outCount; i++) {
        Method method = methods11[i];
        NSLog(@"method's signature: %s", method_getName(method));
    }
    //获取类方法
    Method classMethod111 = class_getClassMethod([Person class], @selector(classMethod));
    if (classMethod != NULL) {
        NSLog(@"class method : %s", method_getName(classMethod111));
    }
    
    free(methods11);}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
