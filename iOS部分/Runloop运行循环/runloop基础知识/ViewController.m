//
//  ViewController.m
//  runloop基础知识
//
//  Created by 张凯泽 on 16/5/25.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)StartClick:(id)sender;
@property(nonatomic,strong)NSThread * thread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)StartClick:(id)sender {
     self.thread = [[NSThread alloc]initWithTarget:self selector:@selector(StartThread) object:nil];
    [self.thread start];
    
}
-(void)StartThread
{
    //使用这种方法不能在 后台或者锁屏  进行循环打印，
    BOOL isRunning = YES;
    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    do
    {
        NSLog(@"--------");
        
        isRunning = [[NSRunLoop currentRunLoop]
                     runMode:NSDefaultRunLoopMode
                     beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.25]];
        
        NSLog(@"end%d",isRunning);
        
       
    } while (isRunning );
    
    
    
    
#pragma mark---zkz------
//    BOOL isRuning = YES;
//    
//    while (isRuning) {
//        NSLog(@"------");
//       // [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop]
//                              runMode:NSDefaultRunLoopMode
//                              beforeDate:[NSDate dateWithTimeIntervalSinceNow:4.0]];
//        //[[NSRunLoop currentRunLoop]run];
//        NSLog(@"end");
//    }

    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //int a = 5;
    //NSAssert(a<0, @"这是是错误的❌");
    [self performSelector:@selector(xxx) onThread:self.thread withObject:nil waitUntilDone:NO];
}
-(void)xxx
{
    NSLog(@"哈哈哈");
}
@end
