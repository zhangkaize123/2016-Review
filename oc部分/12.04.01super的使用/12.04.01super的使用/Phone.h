//
//  Phone.h
//  12.04.01super的使用
//
//  Created by 张凯泽 on 15/12/4.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    kFlashLightStatesOpen,
    kFlashLightStatesClose
}FlashLightStates;
@interface Phone : NSObject
{
    int _cup;
}
+(void)cameraPhoneWithFlashlight:(FlashLightStates)states;
+(void)openFlashLight:(FlashLightStates)states;
+(void)closeFlashLight:(FlashLightStates)states;
@end
