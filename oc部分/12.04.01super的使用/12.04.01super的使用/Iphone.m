//
//  Iphone.m
//  12.04.01super的使用
//
//  Created by 张凯泽 on 15/12/4.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "Iphone.h"

@implementation Iphone
//+(void)load
//{
//    NSLog(@"------%@",[self class]);
//    [super cameraPhoneWithFlashlight:kFlashLightStatesOpen];
//}
//重写父类的方法,增加聚焦的功能
+(void)cameraPhoneWithFlashlight:(FlashLightStates)states;
{
    NSLog(@"增加聚焦的功能");
    //super 是明确告诉程序要执行父类的方法.
    //super使用场合:子类重写父类的方法的时候，像保留父类的一些行为的时候
    //谁调用这个方法，super就代表谁
     NSLog(@"------%@",[super class]);
     NSLog(@"------%@",[self class]);
    [super cameraPhoneWithFlashlight:states];
}

@end
