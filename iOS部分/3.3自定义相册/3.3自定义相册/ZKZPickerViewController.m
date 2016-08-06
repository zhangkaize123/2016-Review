//
//  ZKZPickerViewController.m
//  3.3自定义相册
//
//  Created by 张凯泽 on 16/3/3.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ZKZPickerViewController.h"
#import "ZKZPhoto.h"
#import "ZKZPhotoCell.h"
@interface ZKZPickerViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,weak)UICollectionView *collectview;
@end

@implementation ZKZPickerViewController
- (id)init
{
    self = [super init];
    if (self) {
        //Sets a reasonable default bigger then 0 for columns
        //So that we don't have a divide by 0 scenario
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *cvf=[[UICollectionViewFlowLayout alloc]init];
    CGFloat screenWith=[UIScreen mainScreen].bounds.size.width;
    CGFloat  cellWith = (screenWith - 2)/3;
    cvf.itemSize = CGSizeMake(cellWith, cellWith);
    
    
    cvf.minimumInteritemSpacing = (screenWith-3*cellWith)/2;
    // 4.设置cell之间的垂直间距
    cvf.minimumLineSpacing = 1;
    // 5.设置四周的内边距
    cvf.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    //cvf.itemSize=CGSizeMake(80, 80);
    //cvf.sectionInset=UIEdgeInsetsMake(20, 1, 5, 1);
    //创建集合视图
    UICollectionView *collectview=[[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:cvf];
    //collectview.backgroundColor=[UIColor redColor];
    [self.view addSubview:collectview];
    //注册一个单元格
    [collectview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"mycell"];
    collectview.delegate=self;
    collectview.dataSource=self;
    self.collectview = collectview;
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    self.elcAssets = tempArray;
    self.view.backgroundColor = [UIColor greenColor];
    //设置导航栏按钮
    UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction:)];
    [self.navigationItem setRightBarButtonItem:doneButtonItem];
    [self.navigationItem setTitle:NSLocalizedString(@"Loading...", nil)];
    //加载相册图片
    [self performSelectorInBackground:@selector(preparePhotos) withObject:nil];
}
//加载相册图片方法
- (void)preparePhotos
{
    @autoreleasepool {
        
        [self.elcAssets removeAllObjects];
        [self.assetGroup enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            
            if (result == nil) {
                return;
            }
            
             ZKZPhoto*elcAsset = [[ZKZPhoto alloc] initWithAsset:result];
            //[elcAsset setParent:self];
            
            //BOOL isAssetFiltered = NO;
            
            
                [self.elcAssets addObject:elcAsset];
            //}
            
        }];
        
        [self.collectview reloadData];
    }
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.elcAssets.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"mycell" forIndexPath:indexPath];
   
    ZKZPhoto * photoImage = [self.elcAssets objectAtIndex:indexPath.item];
    ALAsset *asset = photoImage.asset;
     UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:asset.thumbnail]];
    
    
    [cell addSubview:imageView];
    
    return cell;
}



@end
