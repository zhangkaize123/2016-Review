//
//  ZKZWaterCell.h
//  使用UICollectionView实现蘑菇街
//
//  Created by 张凯泽 on 16/3/8.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKZShopModel.h"
@interface ZKZWaterCell : UICollectionViewCell
@property(nonatomic,strong)ZKZShopModel *shop;
@property(nonatomic,strong)NSIndexPath *indexPath;
@end
