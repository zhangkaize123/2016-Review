//
//  ZKZDownloadData.h
//  12.12.00. NSUrlSession
//
//  Created by 张凯泽 on 16/4/28.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZKZDownloadData : NSObject
@property(nonatomic,copy)NSString *urlString;//加载图片的url字符串
@property(nonatomic,assign)BOOL isloading;//
@property(nonatomic,copy)NSString * contentLenth;
@property(nonatomic,assign)long long downloadFileSize;
@property(nonatomic,strong)UIImage *image;//显示的图片
@property(nonatomic,assign)BOOL isFinishDownLoad;
@property(nonatomic,assign)BOOL isClickDownLoad;
@end
