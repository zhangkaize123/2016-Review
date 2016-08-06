//
//  ZKZShopModel.h
//  使用UICollectionView实现蘑菇街
//
//  Created by 张凯泽 on 16/3/8.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKZShopModel : NSObject
 @property(nonatomic,copy)NSString *icon;
 @property(nonatomic,copy)NSString *price;
 @property(nonatomic,assign)int height;
 @property(nonatomic,assign)int width;
 - (instancetype)initWithDict:(NSDictionary *)dict;
 + (instancetype)shopWithDict:(NSDictionary *)dict;

@end
