//
//  ZKZPhoto.h
//  3.3自定义相册
//
//  Created by 张凯泽 on 16/3/3.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface ZKZPhoto : NSObject
@property (nonatomic, strong) ALAsset *asset;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic,assign) int index;
- (id)initWithAsset:(ALAsset*)asset;
@end
