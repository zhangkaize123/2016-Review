//
//  ZKZShopModel.m
//  使用UICollectionView实现蘑菇街
//
//  Created by 张凯泽 on 16/3/8.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ZKZShopModel.h"

@implementation ZKZShopModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    
         if (self = [super init]) {
                 [self setValuesForKeysWithDictionary:dict];
             }
         return self;
     }
 + (instancetype)shopWithDict:(NSDictionary *)dict{
    
         return [[self alloc]initWithDict:dict];
     }
@end
