//
//  ViewController.m
//  12.10.03GCD 多线程总结
//
//  Created by 张凯泽 on 15/12/10.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test4];
}

-(void)test1
{
    //并行队列,进行身份验证
    //阻塞并行队列的执行，要求某一操作执行后再进行后续操作，如用户登录
    dispatch_queue_t queue = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
    //用户登录，用户输入用户名和密码之后，提交到服务器确认身份
    dispatch_async(queue, ^{
        NSLog(@"11111async%@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:2];
        dispatch_sync(queue, ^{
            NSLog(@"22222sync%@",[NSThread currentThread]);
        });
        //确认之前不做其他事情
        dispatch_async(queue, ^{
            NSLog(@"后续任务%@",[NSThread currentThread]);
        });
        
    });

}
-(void)test2
{
#warning mark---zkz--会造成线程阻塞
    /*
     串行队列异步任务中包含同步任务：在串行队列中异步任务分配一个线程去执行，而里边的同步任务也会在这个线程中执行，执行完之后才会结束，但是根据同步任务的特点它必须等到前面的任务结束后才回去执行，所以会造成死锁
     */
    dispatch_queue_t queue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"111111%@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:1];
        
            dispatch_sync(queue, ^{
                NSLog(@"----%@",[NSThread currentThread]);
                [NSThread sleepForTimeInterval:1];
            });
        

//        dispatch_async(queue, ^{
//            NSLog(@"44444%@",[NSThread currentThread]);
//        });
        NSLog(@"333333");
        [NSThread sleepForTimeInterval:1];
        
    });
}
-(void)test3
{
    //创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
    //异步方法
    for (int i = 0; i<5; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%d----%@",i,[NSThread currentThread]);
            [NSThread sleepForTimeInterval:1];
        });
    }
    //同步方法
    for (int i = 0; i<5; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"%d*****%@",i,[NSThread currentThread]);
        });
    }
}
//图片下载使用
-(void)test4
{
    
    dispatch_queue_t queue = dispatch_queue_create("concurrent", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"1111%@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:3];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"2222%@",[NSThread currentThread]);
            [NSThread sleepForTimeInterval:5];
        });
        
        dispatch_async(queue, ^{
             NSLog(@"3333%@",[NSThread currentThread]);
        });
        
    });
}
@end
