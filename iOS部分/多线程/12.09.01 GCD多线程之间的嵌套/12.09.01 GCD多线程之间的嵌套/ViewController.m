//
//  ViewController.m
//  12.09.01 GCD多线程之间的嵌套
//
//  Created by 张凯泽 on 15/12/9.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test3];
}

-(void)syncDemo
{
    //串行队列
    dispatch_queue_t q = dispatch_queue_create("serial1", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(q, ^{
        NSLog(@"111111");
        //会造成线程阻塞，因为是同步任务，顺序执行里边的任务必须等到外边的任务执行完以后才会去执行。
        dispatch_sync(q, ^{
            NSLog(@"2222222");
        });
    });
}
-(void)syncDemo2
{
    //并行队列
    dispatch_queue_t q = dispatch_queue_create("serial1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(q, ^{
        NSLog(@"111111");
        //会造成线程阻塞，因为是同步任务，顺序执行里边的任务必须等到外边的任务执行完以后才会去执行。
        dispatch_sync(q, ^{
            NSLog(@"2222222");
        });
    });

}



-(void)test
{
    dispatch_queue_t q = dispatch_queue_create("serial1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(q, ^{
        NSLog(@"111111%@",[NSThread currentThread]);
        //会造成线程阻塞，因为是同步任务，顺序执行里边的任务必须等到外边的任务执行完以后才会去执行。
        dispatch_sync(q, ^{
            NSLog(@"2222222%@",[NSThread currentThread]);
        });
    });

}
//这种嵌套最合适
-(void)test2
{
    //创建串行队列
    dispatch_queue_t q = dispatch_queue_create("test2", DISPATCH_QUEUE_SERIAL);
    dispatch_async(q, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"网络下载图片%@",[NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"进行UI更新%@",[NSThread currentThread]);
        });
            });
}
-(void)test3
{
    dispatch_queue_t q = dispatch_queue_create("test2", DISPATCH_QUEUE_SERIAL);
    dispatch_async(q, ^{
        NSLog(@"网络请求%@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:3];

    });
    dispatch_async(q, ^{
        NSLog(@"修理图片%@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:3];

        
    });
    dispatch_async(q, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"保存图片%@",[NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"更新UI工作");
        });
        
    });
}
@end
