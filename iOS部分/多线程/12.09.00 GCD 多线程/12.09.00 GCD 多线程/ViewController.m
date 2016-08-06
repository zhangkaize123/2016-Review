//
//  ViewController.m
//  12.09.00 GCD 多线程
//
//  Created by 张凯泽 on 15/12/9.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
/**
 *  1.串行队列同步任务，不需要创建子线程
    2.串行队列异步任务，需要创建一个子线程
 
 
    3.并行队列同步任务，不需要创建子线程
    4.并行队列异步任务，有多少个任务，就开N个线程
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self serialDemo];
    //[self concurrentDemo];
    [self globleDemo];
    //[self mainDemo];
    
}
-(void)mainDemo
{
    /**
     *  主线程队列
     *
     *  一个应用程序只有一个主线程，所有的UI更新都必须在主线程上
     */
    dispatch_queue_t q = dispatch_get_main_queue();
    for (int i = 0; i<5; i++) {
        /**
         *  异步任务在主线程中
         */
        dispatch_async(q, ^{
            NSLog(@"%d----%@",i,[NSThread currentThread]);
        });
    }
    /**
     *  同步任务会造成线程阻塞    因为同步任务，待主线程的任务执行完以后才会去执行打印NSLOG
     */
    for (int i = 0; i<5; i++) {
        /**
         *  异步任务在主线程中
         */
        dispatch_sync(q, ^{
            NSLog(@"%d----%@",i,[NSThread currentThread]);
        });
    }
    
    
}
-(void)globleDemo
{
    /**
     *  全局队列
     *
     *  @param DISPATCH_QUEUE_PRIORITY_DEFAULT 在开发中永远写这个
     *  @param 0 默认是0
     *
     *  @return
     */
    dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    /**
     * 特点：会创建多个线程。操作无序执行，队列前如果有其他任务会等待前面的任务完成之后再执行
     */
    for (int j = 0; j<5; j++) {
        dispatch_async(q, ^{
            NSLog(@"%d---%@",j,[NSThread currentThread]);
            
        });
    }
    /**
     *  特点：同步操作不会新建线程，操作顺序执行
     */
//    for (int i = 0; i<5; i++) {
//        dispatch_sync(q, ^{
//            NSLog(@"%d****%@",i,[NSThread currentThread]);
//        });
//    }


}
#pragma mark - zkz -并行队形
-(void)concurrentDemo
{
#pragma mark - zkz -并行异步
    /**
     *   并行队列
     *
     *  @param "cn.rytong.concurrent"    队列的名称，调试的时候使用
     *  @param DISPATCH_QUEUE_CONCURRENT 创建同步队列
     *
     *  @return nil
     */
    dispatch_queue_t q = dispatch_queue_create("cn.rytong.concurrent", DISPATCH_QUEUE_CONCURRENT);
    #pragma mark - zkz -并行同步
    /**
     *  创建并行同步
     * 特点：不会新建线程，顺序执行
     */

    for (int j = 0; j<5; j++) {
        dispatch_sync(q, ^{
            NSLog(@"%d----%@",j,[NSThread currentThread]);
        });
    }
    /**
     *   创建并行异步
     *   特点： 会新建多个线程，操作无序执行，队列前如果有其他任务，会等到前面的任务完成之后，再执行。
     *   创景：即不影响主线程，又不需要顺序执行的操作。（多个窗口买票系统）
     */

    for (int i = 0; i<5; i ++) {
        dispatch_async(q, ^{
            NSLog(@"%d----%@",i,[NSThread currentThread]);
        });
    }
    
    


}
#pragma mark - zkz -串行队形
-(void)serialDemo
{
    /**
     *  创建一个串行队列（先进先出）
     *
     *  @param "cn.rytong.seril"       队列的名称，调试的时候使用
     *  @param DISPATCH_QUEUE_SERIAL 创建串行队列
     *
     *  @return
     */
    dispatch_queue_t  q = dispatch_queue_create("cn.rytong.seril", DISPATCH_QUEUE_SERIAL);
    /**
     *  创建串行异步
     特点：会创建新线程，操作顺序执行
     */
    /**
     *  2015-12-09 14:04:00.192 12.09.00 GCD 多线程[55460:449726] 1.下载图片<NSThread: 0x7f8053d34c70>{number = 2, name = (null)}
     2015-12-09 14:04:00.193 12.09.00 GCD 多线程[55460:449726] 2.修改图片图片<NSThread: 0x7f8053d34c70>{number = 2, name = (null)}
     2015-12-09 14:04:00.193 12.09.00 GCD 多线程[55460:449726] 3.亮光图片<NSThread: 0x7f8053d34c70>{number = 2, name = (null)}
     2015-12-09 14:04:00.194 12.09.00 GCD 多线程[55460:449726] 4.使用图片<NSThread: 0x7f8053d34c70>{number = 2, name = (null)}

     *
    */
#warning mark - zkz -串行异步    特点：会创建新线程，操作顺序执行
//    dispatch_async(q, ^{
//        NSLog(@"1.下载图片%@",[NSThread currentThread]);
//        
//    });
//    dispatch_async(q, ^{
//        
//        NSLog(@"2.修改图片图片%@",[NSThread currentThread]);
//        
//    });
//    dispatch_async(q, ^{
//        
//        NSLog(@"3.亮光图片%@",[NSThread currentThread]);
//        
//    });
//    dispatch_async(q, ^{
//        NSLog(@"4.使用图片%@",[NSThread currentThread]);
//    });
    /**
     *  串行同步
     特点：不会创建新线程，操作顺序执行
     */
   #warning mark - zkz -串行同步    特点：不会创建新线程，操作顺序执行
    /**
     *  2015-12-09 14:04:56.368 12.09.00 GCD 多线程[55534:450286] 1.下载图片<NSThread: 0x7ffe80c28ca0>{number = 1, name = main}
     2015-12-09 14:04:56.368 12.09.00 GCD 多线程[55534:450286] 2.修改图片图片<NSThread: 0x7ffe80c28ca0>{number = 1, name = main}
     2015-12-09 14:04:56.369 12.09.00 GCD 多线程[55534:450286] 3.亮光图片<NSThread: 0x7ffe80c28ca0>{number = 1, name = main}
     2015-12-09 14:04:56.369 12.09.00 GCD 多线程[55534:450286] 4.使用图片<NSThread: 0x7ffe80c28ca0>{number = 1, name = main}

     */
    dispatch_sync(q, ^{
        NSLog(@"1.下载图片%@",[NSThread currentThread]);
        
    });
    dispatch_sync(q, ^{
        
        NSLog(@"2.修改图片图片%@",[NSThread currentThread]);
        
    });
    dispatch_sync(q, ^{
        
        NSLog(@"3.亮光图片%@",[NSThread currentThread]);
        
    });
    dispatch_sync(q, ^{
        NSLog(@"4.使用图片%@",[NSThread currentThread]);
    });


}

@end
