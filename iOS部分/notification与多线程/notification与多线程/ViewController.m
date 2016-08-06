//
//  ViewController.m
//  notification与多线程
//
//  Created by 张凯泽 on 16/7/18.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "Observer.h"
#import "test.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __autoreleasing Observer *observer = [[Observer alloc] init];
    //test * test1 = [[test alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
