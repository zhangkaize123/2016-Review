//
//  ViewController.m
//  12.10.00 多线程资源掠夺
//
//  Created by 张凯泽 on 15/12/10.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,assign)int ticks;
@property(nonatomic,strong)NSLock *lock;
@property (weak, nonatomic) IBOutlet UILabel *overticks;
@property (weak, nonatomic) IBOutlet UILabel *windowNum;
@property (weak, nonatomic) IBOutlet UILabel *threadNum;
- (IBAction)startClick;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.ticks = 100;
    self.overticks.text = [NSString stringWithFormat:@"%d",self.ticks];
}
-(NSLock *)lock
{
    return [[NSLock alloc]init];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startClick {
   // __weak ViewController * weakSelf = self;
    //__unsafe_unretained ViewController * weakSelf = self;
    //创建串行队列
    dispatch_queue_t q = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
    //一号窗口
    dispatch_async(q, ^{
        [self saleTicks:@"window_1"];

    });
    //二号窗口
    dispatch_async(q, ^{
        [self saleTicks:@"window_2"];
    });
    //三号窗口
    dispatch_async(q, ^{
        [self saleTicks:@"window_3"];
    });
}
-(void)saleTicks:(NSString *)window
{
    //[NSThread sleepForTimeInterval:2];
    
    while (YES) {
        @synchronized(self) {
        if (_ticks>0) {
           
            --_ticks ;
            NSLog(@"剩余票数 %d - %@ - %@", self.ticks, window, [NSThread currentThread]);
            
        }
        
        else{
            break;
        }
        }
        [NSThread sleepForTimeInterval:0.1];
    }
    
}
@end
