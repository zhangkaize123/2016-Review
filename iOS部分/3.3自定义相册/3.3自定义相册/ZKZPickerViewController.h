//
//  ZKZPickerViewController.h
//  3.3自定义相册
//
//  Created by 张凯泽 on 16/3/3.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface ZKZPickerViewController : UIViewController
@property (nonatomic, strong) ALAssetsGroup *assetGroup;
@property (nonatomic, strong) NSMutableArray *elcAssets;
@end
