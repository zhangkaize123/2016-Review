//
//  ZKZDownloadTask.h
//  12.12.00. NSUrlSession
//
//  Created by 张凯泽 on 16/4/28.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol ZKZDownloadTaskDelegate<NSObject>
-(void)ZKZDownloadProgress:(float)progress Percentage:(NSInteger)percentage;
-(void)ZKZDownloadFinished:(UIImage*)fileImage;
-(void)ZKZDownloadFail:(NSError*)error;
@end
@interface ZKZDownloadTask : NSObject<NSURLSessionDataDelegate>
@property(nonatomic,weak)id<ZKZDownloadTaskDelegate>delegate;
-(void)initWithUrlString:(NSString*)urlstring;
-(void)downloadImagedata:(NSString*)urlstring;
@end
