//
//  ZKZOneViewController.m
//  12.18.00 控制器的生命周期
//
//  Created by 张凯泽 on 15/12/18.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "ZKZOneViewController.h"

@interface ZKZOneViewController ()

@end

@implementation ZKZOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"one _____viewDidLoad");
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //NSLog(@"one_____viewWillAppear");
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
     //NSLog(@"one_____viewDidAppear");
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
     //NSLog(@"one_____viewWillDisappear");
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    // NSLog(@"one_____viewDidDisappear");
}
//控制器即将销毁的时候
-(void)viewWillUnload
{
    NSLog(@"one ____viewWillUnload");
    [super viewWillUnload];
}
//控制器已经销毁时调用
-(void)viewDidUnload
{
    NSLog(@"one ___viewDidUnload");
    [super viewDidUnload];
}
-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
