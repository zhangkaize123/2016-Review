//
//  ZKZDownLoadManager.h
//  12.12.00. NSUrlSession
//
//  Created by 张凯泽 on 16/4/29.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKZDownLoadManager : NSObject
@property(nonatomic,assign)NSInteger MaxDownLoadCount;
-(void)addSubQueue:(NSOperation*)Operation;
@end
