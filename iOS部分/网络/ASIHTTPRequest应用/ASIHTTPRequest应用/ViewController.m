//
//  ViewController.m
//  ASIHTTPRequest应用
//
//  Created by 张凯泽 on 16/5/18.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
@interface ViewController ()//<ASIHTTPRequestDelegate,ASIProgressDelegate>
@property(nonatomic,strong)NSOperationQueue *queue;
@property(nonatomic,strong)ASINetworkQueue * queue1;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewe;
- (IBAction)AsyClick:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *progressView;

- (IBAction)Asyclick2:(id)sender;


@property (weak, nonatomic) IBOutlet UISlider *progressView2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.queue = [[NSOperationQueue alloc]init];
    [self.queue setMaxConcurrentOperationCount:1];
    self.queue1 = [ASINetworkQueue queue];
    
}



- (IBAction)AsyClick:(id)sender {
    //http://zyvideo1.oss-cn-qingdao.aliyuncs.com/zyvd/7c/de/04ec95f4fd42d9d01f63b9683ad0
   // https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png
    NSURL *url = [NSURL URLWithString:@"http://zyvideo1.oss-cn-qingdao.aliyuncs.com/zyvd/7c/de/04ec95f4fd42d9d01f63b9683ad0"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setName:@"request1"];
    [request setDownloadProgressDelegate:self];
    [request setDelegate:self];
    [request setDidReceiveResponseHeadersSelector:@selector(RecevieHeaderVaule:)];
    [request setDidStartSelector:@selector(startRequestFun:)];
    //[self.queue addOperation:request];
    [request startAsynchronous];
    //[request startSynchronous];
}
-(void)startRequestFun:(ASIHTTPRequest*)request
{
    NSLog(@"8888888%@",[request responseHeaders]);
}
-(void)RecevieHeaderVaule:(ASIHTTPRequest*)request
{
    
    
    NSLog(@"7777777777%@",[request responseHeaders]);
    
}
- (void)requestFinished:(ASIHTTPRequest *)request
{
    
        NSLog(@"______________%@",[NSThread currentThread]);
    // Use when fetching text data
    NSString *responseString = [request responseString];
    NSLog(@"responseString = %@",responseString);
    // Use when fetching binary data
    NSData *responseData = [request responseData];
    self.imageViewe.image = [UIImage imageWithData:responseData];

    
    }
- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@"error = %@",error);
}
- (void)request:(ASIHTTPRequest *)request didReceiveBytes:(long long)bytes
{
    
    if([request.name isEqualToString:@"request1"])//request1
    {
            NSLog(@"bytes = %lld",bytes);
    }
//    NSLog(@"************%@",[NSThread currentThread]);

}
-(void)setProgress:(float)newProgress
{
    self.progressView.value = newProgress;
    
        self.progressView2.value = newProgress;
    
    
    NSLog(@"-------%f",newProgress);
}
//- (void)request:(ASIHTTPRequest *)request incrementDownloadSizeBy:(long long)newLength
//{
//    NSLog(@"newLength = %lld",newLength);
//}
- (IBAction)Asyclick2:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setName:@"request1"];
   // [request setDownloadProgressDelegate:self];
    //[request setDelegate:self];
    //[request setDidReceiveResponseHeadersSelector:@selector(RecevieHeaderVaule:)];
    //[request setDidStartSelector:@selector(startRequestFun:)];
    self.queue1.delegate = self;
    [self.queue1 setRequestDidStartSelector:@selector(requestDidStartSelector:)];
    [self.queue1 addOperation:request];
    [self.queue1 go];
    //[request startAsynchronous];
//    [self.queue addOperation:request];
    
    }
-(void)requestDidStartSelector:(ASIHTTPRequest*)request
{
    NSLog(@")())()%@",request);
}
@end
