//
//  ZKZView.m
//  touch事件的内部操作
//
//  Created by 张凯泽 on 16/5/31.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ZKZView.h"
@interface ZKZView ()
@property(nonatomic,weak)UIButton *bb;
@property(nonatomic,weak)UIView *view1;
@end
@implementation ZKZView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加到ZKZView上的子视图超出的部分进行裁剪。
       // self.clipsToBounds = YES;
        UIButton * bb = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
        bb.tag = 1000;
        [bb addTarget:self action:@selector(xxx) forControlEvents:UIControlEventTouchUpInside];
        bb.backgroundColor = [UIColor redColor];
        [self addSubview:bb];
        //[self bringSubviewToFront:bb];
        self.bb = bb;
        UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 130)];
        view1.tag = 2000;
        view1.alpha = 0.5;
        view1.backgroundColor = [UIColor greenColor];
        [self addSubview:view1];
        self.view1 = view1;
        

    }
    return self;
}

-(void)xxx
{
    NSLog(@"xxxxxx");
}
-(UIView * )hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"event = %@",event);
    NSLog(@"point = %@",NSStringFromCGPoint(point));
    UIView * resultView = [super hitTest:point withEvent:event];
    NSLog(@"tag=%d",resultView.tag);
    CGPoint buttonPoint = [self.bb convertPoint:point fromView:self];
    NSLog(@"buttonPoint = %@",NSStringFromCGPoint(buttonPoint));
    //这个函数的用处是判断当前的点击或者触摸事件的点是否在当前的view中
    if ([self.bb pointInside:buttonPoint withEvent:event]) {
        return self.bb;
    }
    return resultView;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];
    UITouch *touch = [allTouches anyObject];
    NSLog(@"&&&&&&&&&&%d",[touch view].tag);
    CGPoint point = [touch locationInView:[touch view]];
}
@end
