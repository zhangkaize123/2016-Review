//
//  ViewController.m
//  Runloop运行循环
//
//  Created by 张凯泽 on 16/4/25.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"

static dispatch_queue_t  queue ;
@interface ViewController ()

@property(nonatomic,strong)NSMutableDictionary * LoadDataDic;//存储下载数据
- (IBAction)TaskOne;//下载任务一
- (IBAction)TastTwo;//下载任务二
- (IBAction)TaskThree;//下砸任务三
- (IBAction)ExitThreadClick;//退出线程click
@property(nonatomic,strong)NSThread *thread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.thread = [[NSThread alloc]initWithTarget:self selector:@selector(threadFunc11) object:nil];
    //[self.thread start];
    //self.LoadDataDic = [NSMutableDictionary dictionary];
   // queue = dispatch_queue_create("zkz", DISPATCH_QUEUE_SERIAL);
    
}
-(void)threadFunc11{
//     [NSThread sleepForTimeInterval:16.0];
//    NSArray * array = @[@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png",@"http://www.cnblogs.com/images/logo_small.gif",@"http://v.hinews.cn/img/zhuaqu/20140617/569140617120506.jpg",@"http://imgsrc.baidu.com/forum/pic/item/f8cd7cd9cfcae66a38012f3b.jpg"];
//    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    for (int index = 0; index < array.count; index ++)
//    {
//        dispatch_sync(queue, ^{
//            NSURL * url = [NSURL URLWithString:array[index]];
//            NSURLRequest *resqust = [NSURLRequest requestWithURL:url];
//            NSURLSession * session = [NSURLSession sessionWithConfiguration:configuration];
//            NSURLSessionDataTask * dataTask = [session dataTaskWithRequest:resqust completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                if (data) {
//                    [self.LoadDataDic setObject:data forKey:[NSString stringWithFormat:@"%d",index]];
//                }
//                
//                NSLog(@"xxxx111%@",self.LoadDataDic);
//            } ];
//            [dataTask resume];
//        });
//        
//    }

//    CFRunLoopObserverRef observerRef = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(),kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//        NSLog(@"activity = %lu",activity);
//        
//    });
//    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observerRef,kCFRunLoopDefaultMode);
//
    NSRunLoop * runLoop = [NSRunLoop currentRunLoop];
    [runLoop addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    NSLog(@"11111%@",[NSThread currentThread]);
    while (![[NSThread currentThread] isCancelled])
    {
        @autoreleasepool {
            NSLog(@"________");
        [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
        
        NSLog(@"runloop end");
    }
    
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    //[ self performSelector:@selector(performFun) onThread:self.thread withObject:nil waitUntilDone:NO];

}
-(void)performFun
{
    NSLog(@"performFun");
//    [[NSThread currentThread] cancel];
//    CFRunLoopStop(CFRunLoopGetCurrent());
     NSLog(@"_______111%@",self.LoadDataDic);
}
- (IBAction)TaskOne {
    [ self performSelector:@selector(DownLoadTaskOne) onThread:self.thread withObject:nil waitUntilDone:NO];
}
-(void)performFun1
{
    NSLog(@"打印taskone");
}
-(void)DownLoadTaskOne
{
    [NSThread sleepForTimeInterval:4.0];
    NSArray * array = @[@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png",@"http://www.cnblogs.com/images/logo_small.gif",@"http://v.hinews.cn/img/zhuaqu/20140617/569140617120506.jpg",@"http://imgsrc.baidu.com/forum/pic/item/f8cd7cd9cfcae66a38012f3b.jpg"];
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    for (int index = 0; index < array.count; index ++)
    {
        dispatch_sync(queue, ^{
            NSURL * url = [NSURL URLWithString:array[index]];
            NSURLRequest *resqust = [NSURLRequest requestWithURL:url];
            NSURLSession * session = [NSURLSession sessionWithConfiguration:configuration];
            NSURLSessionDataTask * dataTask = [session dataTaskWithRequest:resqust completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (data) {
                    [self.LoadDataDic setObject:data forKey:[NSString stringWithFormat:@"%d",index]];
                }
               
                
            } ];
            [dataTask resume];
        });
        
    }
    
}
- (IBAction)TastTwo {
    [NSThread sleepForTimeInterval:60.0];
    NSArray * array = @[@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png",@"http://www.cnblogs.com/images/logo_small.gif",@"http://v.hinews.cn/img/zhuaqu/20140617/569140617120506.jpg",@"http://imgsrc.baidu.com/forum/pic/item/f8cd7cd9cfcae66a38012f3b.jpg"];
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    for (int index = 0; index < array.count; index ++)
    {
        dispatch_sync(queue, ^{
            NSURL * url = [NSURL URLWithString:array[index]];
            NSURLRequest *resqust = [NSURLRequest requestWithURL:url];
            NSURLSession * session = [NSURLSession sessionWithConfiguration:configuration];
            NSURLSessionDataTask * dataTask = [session dataTaskWithRequest:resqust completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (data) {
                    [self.LoadDataDic setObject:data forKey:[NSString stringWithFormat:@"%d",index]];
                }
                
                NSLog(@"xxxx111%@",self.LoadDataDic);
            } ];
            [dataTask resume];
        });
        
    }

    //[ self performSelector:@selector(performFun22) onThread:self.thread withObject:nil waitUntilDone:NO];
}
-(void)performFun22
{
    
}

- (IBAction)TaskThree {
}

- (IBAction)ExitThreadClick {
    [self performSelector:@selector(performFun) onThread:self.thread withObject:nil waitUntilDone:NO];
}


@end
