//
//  ZKZOneViewController.m
//  12.17.02UINavigationController详解
//
//  Created by 张凯泽 on 15/12/17.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "ZKZOneViewController.h"

@interface ZKZOneViewController ()

- (IBAction)sadfg;
@end

@implementation ZKZOneViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationItem.title = @"第1个控制器";
    
    // 修改下一个界面返回按钮的文字
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sadfg {
}
@end
