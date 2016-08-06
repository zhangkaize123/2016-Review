//
//  Iphone.h
//  12.03.01oc中self的使用
//
//  Created by 张凯泽 on 15/12/3.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    kFlashLightStatesOpen,
    kFlashLightStatesClose
}FlashLightStates;
@interface Iphone : NSObject
+(void)cameraPhoneWithFlashlight:(FlashLightStates)states;
+(void)openFlashLight:(FlashLightStates)states;
+(void)closeFlashLight:(FlashLightStates)states;
-(void)test;

@end
