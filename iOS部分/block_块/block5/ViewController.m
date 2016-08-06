//
//  ViewController.m
//  block5
//
//  Created by 张凯泽 on 16/6/22.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "ViewController.h"
typedef void (^blk_t)(id obj);
blk_t blk;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self captureObject];
    blk([[Dog alloc]init]);
    blk([[Dog alloc]init]);
    blk([[Dog alloc]init]);
}
- (void)captureObject
{
    NSMutableArray * array = [[NSMutableArray alloc] init];
    blk = ^(id obj) {
        [array addObject:obj];
        NSLog(@"array count = %d", [array count]);
    } ;
    NSLog(@"blk = %@",blk);
    //NSLog(@"array count = %ld", (unsigned long)[array retainCount]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
