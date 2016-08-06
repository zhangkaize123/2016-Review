//
//  Iphone.h
//  12.03.01第一个Oc类
//
//  Created by 张凯泽 on 15/12/3.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    kGlodColor,
    kWhiteColor,
    kBlackColor
}IphoneClolor;
@interface Iphone : NSObject
{
    @public
    float _size;
    IphoneClolor color;
    
}
@end
