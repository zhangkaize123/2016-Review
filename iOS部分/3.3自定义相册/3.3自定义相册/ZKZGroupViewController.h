//
//  ZKZGroupViewController.h
//  3.3自定义相册
//
//  Created by 张凯泽 on 16/3/3.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface ZKZGroupViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *assetGroups;//组模块数组
@property (nonatomic, strong) NSArray *mediaTypes;//资源类型
@end
