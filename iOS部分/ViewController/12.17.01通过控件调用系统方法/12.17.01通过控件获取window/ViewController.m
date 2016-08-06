//
//  ViewController.m
//  12.17.01通过控件获取window
//
//  Created by 张凯泽 on 15/12/17.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "ZKZTestView.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZKZTestView * testView = [[ZKZTestView alloc]init];
    testView.frame = CGRectMake(100, 100, 100, 100);
    testView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:testView];
    [UIView animateWithDuration:2 animations:^{
        testView.frame = CGRectMake(50, 50, 100, 100);
    }];
    
    
}




@end
