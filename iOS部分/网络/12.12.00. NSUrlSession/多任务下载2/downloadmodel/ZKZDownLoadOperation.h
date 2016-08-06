//
//  ZKZDownLoadOperation.h
//  12.12.00. NSUrlSession
//
//  Created by 张凯泽 on 16/4/29.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol ZKZDownloadTaskDelegate<NSObject>
-(void)ZKZDownloadProgress:(float)progress Percentage:(NSInteger)percentage;
-(void)ZKZDownloadFinished2:(UIImage*)fileImage;
-(void)ZKZDownloadFail:(NSError*)error;
@end
@interface ZKZDownLoadOperation : NSOperation<ZKZDownloadTaskDelegate>
@property(nonatomic,weak)id<ZKZDownloadTaskDelegate>delegate;
-(instancetype)initWithDownLoadUrlString:(NSString *)urlString;
@end
