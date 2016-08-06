//
//  ViewController.m
//  operation操作
//
//  Created by 张凯泽 on 16/7/22.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //把操作加在队列中相当于异步任务
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    NSBlockOperation * block = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"sjofwe");
    }];
    [queue addOperation:block];
    //[block start];
    //[queue addOperation:block];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
