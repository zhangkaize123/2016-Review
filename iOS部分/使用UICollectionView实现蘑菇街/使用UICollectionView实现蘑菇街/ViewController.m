//
//  ViewController.m
//  使用UICollectionView实现蘑菇街
//
//  Created by 张凯泽 on 16/3/8.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "ZKZShopModel.h"
#import "ZKZWaterFlowLayout.h"
#import "ZKZWaterCell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSArray *shops;
@end

@implementation ViewController
static NSString *ID = @"water";
- (NSArray *)shops{
    
    if (_shops == nil) {
        //        1.读取文件
        NSString *path =  [[NSBundle mainBundle ]pathForResource:@"1.plist" ofType:nil];
        NSArray *dictArray =  [NSArray arrayWithContentsOfFile:path];
        //        2.字典转模型
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            ZKZShopModel *shop = [ZKZShopModel shopWithDict:dict];
            [tempArray addObject:shop];
            
        }
        _shops = tempArray;
        
        
        
    }
    return _shops;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor lightGrayColor];
     ZKZWaterFlowLayout*waterFlowLayout = [[ZKZWaterFlowLayout alloc]init];
   
     //    0.1.传递外界数组到内部
         waterFlowLayout.shops = self.shops;
    
     //    1.创建collectionView
         UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:waterFlowLayout];
    collectionView.backgroundColor = [UIColor lightGrayColor];
     //    2.设置数据源
         collectionView.dataSource = self;
     ////    3.设置代理
         collectionView.delegate = self;
    
    
     //    3.添加
         [self.view addSubview:collectionView];
     //    4.注册cell
         [collectionView registerNib:[UINib nibWithNibName:@"ZKZWaterCell" bundle:nil] forCellWithReuseIdentifier:ID];
    
    
}
#pragma mark---zkz--
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return  1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.shops.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //    1.创建cell
    
     ZKZWaterCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    //    2.赋值
    //
        cell.backgroundColor = [UIColor whiteColor];
    //    2.1获取模型
    ZKZShopModel *shop = self.shops[indexPath.item];
    cell.shop = shop;
    
    cell.indexPath=indexPath;
    //   3.返回cell
    return cell;
    
    
}

@end
