//
//  main.m
//  12.04.01super的使用
//
//  Created by 张凯泽 on 15/12/4.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Iphone.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [Iphone cameraPhoneWithFlashlight:kFlashLightStatesOpen];
    }
    return 0;
}
