//
//  ZKZWaterCell.m
//  使用UICollectionView实现蘑菇街
//
//  Created by 张凯泽 on 16/3/8.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ZKZWaterCell.h"
@interface ZKZWaterCell()
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@end
@implementation ZKZWaterCell
- (void)setShop:(ZKZShopModel *)shop{
    
         _shop = shop;
    
         self.iconView.image = [UIImage imageNamed:shop.icon];
         //self.priceLabel.text = shop.price;
    
     }
 -(void)setIndexPath:(NSIndexPath *)indexPath{
    
         _indexPath = indexPath;
         self.priceLabel.text = self.shop.price;
     
     }
@end
