//
//  ZKZTwoViewController.m
//  12.18.00 控制器的生命周期
//
//  Created by 张凯泽 on 15/12/18.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "ZKZTwoViewController.h"
@class Person;
@interface ZKZTwoViewController ()
@property(nonatomic,strong)Person *p;
@end

@implementation ZKZTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//控制器即将销毁的时候前提是发生了内存警告
-(void)viewWillUnload
{
    NSLog(@"viewWillUnload");
    [super viewWillUnload];
}
//控制器已经销毁时调用前提是发生了内存警告
-(void)viewDidUnload
{
#warning mark--zkz---在这里释放控制器里边的属性
    /*
     一般是这样写，对于arc与非arc都适用
     */
    self.p = nil;
    NSLog(@"viewDidUnload");
    [super viewDidUnload];
}

-(void)dealloc
{
    NSLog(@"two____dealloc");
    //[super dealloc];
}
@end
