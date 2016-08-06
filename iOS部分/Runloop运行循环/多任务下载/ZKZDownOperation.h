//
//  ZKZDownOperation.h
//  Runloop运行循环
//
//  Created by 张凯泽 on 16/4/26.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKZDownOperation : NSOperation<NSURLSessionDataDelegate>
@property(nonatomic,strong)NSFileManager *fileManager;//文件管理者
@property(nonatomic,copy)NSString *createPath;//文件夹imge
@end
