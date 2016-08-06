//
//  ZKZPhoto.m
//  3.3自定义相册
//
//  Created by 张凯泽 on 16/3/3.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ZKZPhoto.h"

@implementation ZKZPhoto
- (id)initWithAsset:(ALAsset*)asset
{
    self = [super init];
    if (self) {
        self.asset = asset;
        _selected = NO;
    }
    return self;
}

@end
