//
//  Phone.m
//  12.04.01super的使用
//
//  Created by 张凯泽 on 15/12/4.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "Phone.h"

@implementation Phone
+(void)cameraPhoneWithFlashlight:(FlashLightStates)states;
{
    if (states == kFlashLightStatesOpen) {
        //[Iphone openFlashLight:kFlashLightStatesOpen];
        // self == Iphone   谁调用这个方法，self就代表谁
        //在main.m中使用iPhone 调用cameraPhoneWithFlashlight方法，在这个方法中self就代表iPhone。
#warning mark --zkz----self的含义：1.在对象的方法中self代表对象2.在类的方法中代表类
        
        [self openFlashLight:kFlashLightStatesOpen];
    }else {
        /**
         *  在类方法中利用self可以调用其他类方法，
         */
        [self closeFlashLight:kFlashLightStatesClose];
    }
}

+(void)openFlashLight:(FlashLightStates)states
{
    if (states == kFlashLightStatesOpen) {
        NSLog(@"打开闪光灯");
    }
}
+(void)closeFlashLight:(FlashLightStates)states
{
    if (states == kFlashLightStatesClose) {
        NSLog(@"关闭闪光灯");
    }
}

@end
