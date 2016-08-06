//
//  ViewController.m
//  touch事件的内部操作
//
//  Created by 张凯泽 on 16/5/31.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "ZKZView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZKZView * view11 = [[ZKZView alloc]initWithFrame:CGRectMake(50, 100, 250, 250)];
    view11 .backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view11];
}
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    UIView *result = [super hitTest:point withEvent:event];
//    CGPoint buttonPoint = [underButton convertPoint:point fromView:self];
//    if ([underButton pointInside:buttonPoint withEvent:event]) {
//        return underButton;
//    }
//    return result;
//}
@end
