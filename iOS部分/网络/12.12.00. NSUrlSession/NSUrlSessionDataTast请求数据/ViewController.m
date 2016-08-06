//
//  ViewController.m
//  NSUrlSessionDataTast请求数据
//
//  Created by 张凯泽 on 16/3/10.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@property(nonatomic,strong)NSURLRequest *resquest;
@property(nonatomic,strong)NSURL *url;
@property(nonatomic,strong)NSMutableURLRequest *MutableRequest;
- (IBAction)RequestDataClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

@end

@implementation ViewController
//设置url
-(NSURL*)url
{
    if (_url == nil) {
        _url = [[NSURL alloc]initWithString:@"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png"];
    }
    return _url;
}
//使用get方式设置请求




-(NSURLRequest*)resquest
{
    if (_resquest == nil) {
        _resquest = [[NSURLRequest alloc]initWithURL:self.url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    }
    NSLog(@"_resquest = %@",_resquest);
    return _resquest;
}
//使用post方式设置请求
-(NSMutableURLRequest*)MutableRequest
{
    if (_MutableRequest == nil) {
        _MutableRequest = [[NSMutableURLRequest alloc]initWithURL:self.url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
        _MutableRequest.HTTPBody = [[NSData alloc]init];
        _MutableRequest.HTTPMethod = @"POST";
    }
    return _MutableRequest;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


//请求数据
- (IBAction)RequestDataClick:(id)sender {
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession * session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask * dataTask = [session dataTaskWithRequest:self.resquest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"______%@",[NSThread currentThread]);
        NSLog(@"response = %@",response);
        if (data) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.ImageView.image = [[UIImage alloc]initWithData:data];
                            });
        }
                
    } ];
    [dataTask resume];
}
@end
