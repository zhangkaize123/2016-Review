//
//  ZKZDownLoadManager.m
//  12.12.00. NSUrlSession
//
//  Created by 张凯泽 on 16/4/29.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ZKZDownLoadManager.h"
@interface ZKZDownLoadManager()
@property(nonatomic,strong)NSOperationQueue *queue;
@end
@implementation ZKZDownLoadManager
-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(NSOperationQueue*)queue
{
    _queue = [[NSOperationQueue alloc]init];
    return _queue;
}

-(void)setMaxDownLoadCount:(NSInteger)MaxDownLoadCount
{
    _MaxDownLoadCount = MaxDownLoadCount;
}
-(void)addSubQueue:(NSOperation*)Operation
{
    [self.queue addOperation:Operation];
    self.queue.maxConcurrentOperationCount = _MaxDownLoadCount;
}
@end
