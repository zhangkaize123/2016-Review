//
//  ZKZTableViewCell.h
//  12.12.00. NSUrlSession
//
//  Created by 张凯泽 on 16/4/27.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZKZDownloadTask.h"
#import "ZKZDownloadData.h"
@class ZKZTableViewCell2;
@protocol ZKZTableViewCelldelegate <NSObject>
-(void)cellButtonClickTapWith:(ZKZTableViewCell2*)cell;
@end
@interface ZKZTableViewCell2 : UITableViewCell<ZKZDownloadTaskDelegate>
@property(nonatomic,weak)id<ZKZTableViewCelldelegate>CellDelegate;
@property(nonatomic,strong)ZKZDownloadData *downLoadData;
@end
