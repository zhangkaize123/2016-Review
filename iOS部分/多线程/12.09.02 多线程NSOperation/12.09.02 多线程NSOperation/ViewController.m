//
//  ViewController.m
//  12.09.02 多线程NSOperation
//
//  Created by 张凯泽 on 15/12/9.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) NSOperationQueue * q;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test3];
}
#pragma mark--zkz-顺序执行
-(void)test3
{
    /*
        放在队列的操作它们执行的
     q.maxConcurrentOperationCount = 1; 设置为1的时候:
     2016-07-31 19:27:03.170 12.09.02 多线程NSOperation[6242:1708343] 网络请求<NSThread: 0x79767860>{number = 2, name = (null)}
     2016-07-31 19:27:03.188 12.09.02 多线程NSOperation[6242:1708310] 更新UI图片<NSThread: 0x7975ff30>{number = 1, name = main}
     2016-07-31 19:27:06.172 12.09.02 多线程NSOperation[6242:1708343] 修理图片<NSThread: 0x79767860>{number = 2, name = (null)}
     2016-07-31 19:27:09.248 12.09.02 多线程NSOperation[6242:1708343] 保存图片<NSThread: 0x79767860>{number = 2, name = (null)}
     
     
     增加依赖之后:
     2016-07-31 19:29:27.081 12.09.02 多线程NSOperation[6402:1710286] 网络请求<NSThread: 0x79e847a0>{number = 2, name = (null)}
     2016-07-31 19:29:30.205 12.09.02 多线程NSOperation[6402:1710286] 修理图片<NSThread: 0x79e847a0>{number = 2, name = (null)}
     2016-07-31 19:29:33.255 12.09.02 多线程NSOperation[6402:1710286] 保存图片<NSThread: 0x79e847a0>{number = 2, name = (null)}
     2016-07-31 19:29:33.255 12.09.02 多线程NSOperation[6402:1710254] 更新UI图片<NSThread: 0x7b07f0f0>{number = 1, name = main}
     
     */
    NSOperationQueue *q = [[NSOperationQueue alloc]init];
    
    NSBlockOperation * block1 =[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"网络请求%@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:5];
        
    }];
    NSBlockOperation * block2 =[NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"修理图片%@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:3];
    }];
    NSBlockOperation * block3 =[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"保存图片%@",[NSThread currentThread]);
    }];
    NSBlockOperation * block4 =[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"更新UI图片%@",[NSThread currentThread]);
    }];
    
    //block2 依赖于block1
    //[block2 addDependency:block1];
//    //block3 依赖于block2
    //[block3 addDependency:block2];
    //block4 依赖于block3
#pragma mark--kzz---依赖关系是可以跨队列的
    //[block4 addDependency:block3];
    
    [q addOperation:block1];
    [q addOperation:block2];
    [q addOperation:block3];
    [[NSOperationQueue mainQueue] addOperation:block4];
}
-(void)test2
{
    self.q = [[NSOperationQueue alloc]init];
    NSInvocationOperation * invoca = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(actionOP:) object:@"123"];
    [self.q addOperation:invoca];

}
-(void)actionOP:(id)obj
{
    NSLog(@"%@",obj);
}
-(void)test1
{
    //自定义队列
    self.q = [[NSOperationQueue alloc]init];
    NSBlockOperation *blockOp = [NSBlockOperation blockOperationWithBlock:^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"网络请求%@",[NSThread currentThread]);
        //主队列
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            NSLog(@"UI更新%@",[NSThread currentThread]);
        }];
    }];
    [self.q addOperation:blockOp];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
