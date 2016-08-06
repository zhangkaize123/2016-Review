//
//  ViewController.m
//  runloop1
//
//  Created by 张凯泽 on 16/6/30.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL isStop;
}
- (IBAction)stopClick:(id)sender;
@property(nonatomic,strong)NSThread *thread;
@property(nonatomic,strong)NSThread *thread1;
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     
     //如果 waitUntilDone:YES的时候后边操作都会等待 performfun1 方法执行完之后再去执行之后的操作。
    NSLog(@"begin");
    //[self performSelector:@selector(performfun1) onThread: withObject:nil waitUntilDone:YES];
    [self performSelectorOnMainThread:@selector(performfun1) withObject:nil waitUntilDone:NO];
    NSLog(@"end");
    */
    self.thread = [[NSThread alloc]initWithTarget:self selector:@selector(threadfun) object:nil];
    //[self.thread start];
    self.timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(timerClick) userInfo:nil repeats:YES];
    self.thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(threadfun1) object:nil];
    [self.thread1 start];
}
-(void)threadfun1
{
    BOOL isRunning = YES;
    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
   do
    {
        NSLog(@"00000000000000");
        
            isRunning = [[NSRunLoop currentRunLoop]
                     runMode:NSDefaultRunLoopMode
                     beforeDate:[NSDate distantFuture]];
        //isRunning = [[NSRunLoop currentRunLoop]runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        //            [[NSRunLoop currentRunLoop]run];
        NSLog(@"----%d",isRunning);
        
            } while (isRunning);
    NSLog(@"end");
}

-(void)threadfun
{
//    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
//    CFStringRef runLoopMode = kCFRunLoopDefaultMode;
//    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler
//    (kCFAllocatorDefault, kCFRunLoopBeforeWaiting, true, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity _) {
//        NSLog(@"kCFRunLoopBeforeWaiting");
//        
//        
//    });
//    CFRunLoopAddObserver(runLoop, observer, runLoopMode);
    NSLog(@"-----");
    @autoreleasepool {
        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        //
        //[[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSDefaultRunLoopMode];
        /* run 与 runUntilDate:都是有事就干没事就休息，而runMode:beforeDate: 时间一到就会退出循环,而且只运行一次循环。
         */
          //[[NSRunLoop currentRunLoop]run];
        //[[NSRunLoop currentRunLoop]runUntilDate:[NSDate distantFuture]];
        //[[NSRunLoop currentRunLoop]
                     //runMode:NSDefaultRunLoopMode
                     //beforeDate:[NSDate distantFuture]];
        [[NSRunLoop currentRunLoop]runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:3.0]];
        /*
         1.只能执行一次循环2.距离现在3s后不执行循环就会结束
         */
       //CFRunLoopRef runloop = CFRunLoopGetCurrent();
        
        NSLog(@"8888");
    }
   // NSPort * port = [NSPort port];
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self performSelector:@selector(performfun) onThread:self.thread1 withObject:nil waitUntilDone:YES];
    
    
    
}
-(void)performfun
{
    for (int i = 0; i<20; i++) {
        //[NSThread sleepForTimeInterval:2.0];
        NSLog(@"performfun");

    }
    CFRunLoopStop(CFRunLoopGetCurrent());
    NSThread *thread = [NSThread currentThread];
    NSLog(@"%@",thread);
    [thread cancel];
    
}
-(void)timerClick
{
    NSLog(@"timerClick");
}
-(void)performfun1
{
    [NSThread sleepForTimeInterval:5.0];
    NSLog(@"performfun1");
    
}
- (IBAction)stopClick:(id)sender {
    [self performSelector:@selector(performfun2) onThread:self.thread1 withObject:nil waitUntilDone:NO];
    
}
-(void)performfun2
{
    
    CFRunLoopStop(CFRunLoopGetCurrent());
}
@end
