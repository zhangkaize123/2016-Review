//
//  ZKZWaterFlowLayout.m
//  使用UICollectionView实现蘑菇街
//
//  Created by 张凯泽 on 16/3/8.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ZKZWaterFlowLayout.h"
#import "ZKZShopModel.h"
const int column = 3;
@interface ZKZWaterFlowLayout()

@property(nonatomic,strong)NSMutableArray *maxYs;
@end
@implementation ZKZWaterFlowLayout
- (NSMutableArray *)maxYs{
    
    if (_maxYs == nil) {
        _maxYs = [NSMutableArray array];
        NSLog(@"%@",_maxYs);
        
    }
    
    return _maxYs;
}
/**
*  用来设置每一个对应位置的item属性
*
*  @param indexPath 用来确定每一item具体位置
*
*  @return 用来设置每一个item的属性
*/
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"layoutAttributesForItemAtIndexPath");
    //    1.确定上左下右间距
    
         UIEdgeInsets edge = UIEdgeInsetsMake(20, 0, 0, 0);
        //     2.确定宽度
     //        2.1确定列数
    
     //        2.2确定行间距和列间距
         CGFloat rowMargin = 5;
         CGFloat colMargin = 5;
    
         CGFloat itemW = (self.collectionView.frame.size.width - edge.left - edge.right - (column - 1)*colMargin)/column;
     //        3.确定高度
     //        3.1获取对应item的模型
         ZKZShopModel *shop = self.shops[indexPath.item];
     //    itemW/itemh = shop.width/shop.height;
    
         CGFloat itemH = shop.height *itemW/shop.width;
    
     //    CGFloat itmeH = 100+ arc4random_uniform(100);
     //        4.确定位置
    
     //        4.1获取最小的最大y值
     //        4.2用一个值来记录最小的最大y值
         CGFloat minMaxY = MAXFLOAT;
     //        4.3记录最小的最大的y值所在的列号；
         NSInteger minMaxCol = 0;
         for (int i = 0; i <column; i ++) {
                 CGFloat maxY = [self.maxYs[i]doubleValue];
                 if (maxY < minMaxY) {
                         minMaxY = maxY;
                         minMaxCol = i;
                     }
             }
     //     4.4设置item的x值
         CGFloat itemX = edge.left + (itemW + colMargin) *minMaxCol;
         CGFloat itemY = minMaxY + rowMargin;
     //    5.获取每一个对应位置的item的属性
         UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
     //    6.设置属性的frame
    static int count = 0;
    if (indexPath.item<=2) {
        count=1;
        if (count==1) {
            itemY +=20;
        }
        
        attr.frame = CGRectMake(itemX, itemY, itemW, itemH);
    }else{
         attr.frame = CGRectMake(itemX, itemY, itemW, itemH);
    }
     //    7.累加最小的最大的y值
    
         self.maxYs[minMaxCol]= @(CGRectGetMaxY(attr.frame));
    
    
    
     //    8.返回属性
         return  attr;
}
/**
*  用来设置给定范围内所有的属性
*
*  @param rect <#rect description#>
*
*  @return <#return value description#>
*/
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // NSLog(@"调用了layoutAttributesForElementsInRect");
    //    0.清空原来的所有的值
    
    //    1.设置数组的值
    for (int i = 0 ; i <column;i ++) {
        
        self.maxYs[i]=@(0);
    }
    
    
    //    2.创建可变数组
    NSMutableArray *attrs = [NSMutableArray array];
    
    //
    
    //    3.获取所有的item的属性的个数
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    //    4.遍历多次，添加对应的属性值
    for (int i = 0; i < count; i ++ ) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:indexPath];
        [attrs addObject:attr];
        
    }
    return attrs;
    
    
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    //  NSLog(@"调用了shouldInvalidateLayoutForBoundsChange");
    return YES;
}
 /**
     140  *  用来设置collectionView的滚动范围
     141  *
     142  *  @return <#return value description#>
     143  */

- (CGSize)collectionViewContentSize{
    // NSLog(@"调用了collectionViewContentSize");
    //    1.获取最大最大y值
    CGFloat maxMaxY = 0;
    //    1.1.记录最大的最大y值
    if (self.maxYs.count) {
        maxMaxY = [self.maxYs[0]doubleValue];
        for (int i = 1; i < column; i ++) {
            //        1.2获取每一个值
            CGFloat maxY = [self.maxYs[i]doubleValue];
            if (maxY > maxMaxY) {
                maxMaxY = maxY;
            }
            
        }
        
    }
    return CGSizeMake(0, maxMaxY);
    
    
}
@end
