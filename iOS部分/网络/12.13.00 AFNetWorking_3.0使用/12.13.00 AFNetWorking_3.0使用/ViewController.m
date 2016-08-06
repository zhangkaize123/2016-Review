//
//  ViewController.m
//  12.13.00 AFNetWorking_3.0使用
//
//  Created by 张凯泽 on 15/12/13.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
@interface ViewController ()<NSURLSessionDelegate,NSURLSessionTaskDelegate,NSURLSessionDownloadDelegate>
- (IBAction)DownLoadClick;
- (IBAction)cookieCick:(id)sender;
@property(nonatomic,strong)NSURLRequest *request;
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
- (IBAction)SessionClick:(id)sender;
@end

@implementation ViewController
- (IBAction)DownLoadClick {
    //AFURLSessionManager是文件下载类
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    //使用 NSURLSessionDownloadTask下载图片
//  NSURLSessionDownloadTask *downloadTask =  [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
//      //NSLog(@"------%lld---",downloadProgress.completedUnitCount);
//    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
//        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
//            return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
//    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
//        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
//        for (NSHTTPCookie *tempCookie in cookies) {
//            //打印获得的cookie
//            NSLog(@"getCookie: %@", tempCookie);
//        }
//                 NSLog(@"File downloaded to: %@", filePath);
//    }];
//    [downloadTask resume];
    
    
    NSURLSessionDataTask * dataTast = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"downloadProgress.completedUnitCount = %lld,downloadProgress.totalUnitCount = %lld",downloadProgress.completedUnitCount,downloadProgress.totalUnitCount);
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"response = %@",response);
        NSLog(@"responseObject = %@",responseObject);
        
        //self.showImage.image = [UIImage alloc]initWithData:response.
        
    }];
    [dataTast resume];
    

}

- (IBAction)cookieCick:(id)sender {
    
    // AFHTTPSessionManager 是get/post请求，用户名与密码，格式
    NSURL *URL = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //manager.responseSerializer.
    [manager GET:[URL absoluteString] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"----success");
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
       // NSLog(@"---------%d",[[NSHTTPCookieStorage sharedHTTPCookieStorage]cookieAcceptPolicy]);
        
        for (NSHTTPCookie *tempCookie in cookies) {
            //打印获得的cookie
            NSLog(@"getCookie: %@", tempCookie);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@",error);
    }];
    
   
//
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

}

-(NSURLRequest *)request
{
    NSURL * url = [NSURL URLWithString:@"http://attimg.dospy.com/img/day_100404/20100404_09de7a322753654dc6d186gqC78Q8cM8.png"];
    NSURLRequest *resqust = [NSURLRequest requestWithURL:url];
    
    return resqust;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString * s1 = @"12345";
//    NSString * s2 = s1;
//    s2 = nil;
//    NSLog(@"s1 = %@",s1);
//    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
//    for (NSHTTPCookie *tempCookie in cookies) {
//        //打印获得的cookie
//        NSLog(@"getCookie: %@", tempCookie);
//    }
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *docDir = [paths objectAtIndex:0];
//    NSLog(@"docDir = %@",docDir);
    
    }


- (IBAction)SessionClick:(id)sender {
    NSURLSession * session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration  defaultSessionConfiguration] delegate:self delegateQueue:nil];
    NSURLSessionDownloadTask * DownLoadTask = [session downloadTaskWithURL:[NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"]];
    [DownLoadTask resume];
   // NSURLSessionDataTask * dataTask = [session dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"]]];
    //[dataTask resume];
    
}
#pragma mark---zkz--NSURLSessionDelegate
- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(nullable NSError *)error
{
    NSLog(@"NSURLSessionDelegate -----didBecomeInvalidWithError");
}

#pragma mark---zkz--NSURLSessionTaskDelegate
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
didCompleteWithError:(nullable NSError *)error
{
    NSLog(@"NSURLSessionTaskDelegate----didCompleteWithError");
}
#pragma mark---zkz--NSURLSessionDownloadDelegate
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location;
{
    NSLog(@"NSURLSessionDownloadDelegate------didFinishDownloadingToURL");
}
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    NSLog(@"NSURLSessionDownloadDelegate----didWriteData");
    [downloadTask cancel];
}
#pragma mark---zkz--NSURLSessionDataDelegate
//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
//didReceiveResponse:(NSURLResponse *)response
// completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler
//{
//    NSLog(@"NSURLSessionDataDelegate----didReceiveResponse");
//}
//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
//    didReceiveData:(NSData *)data
//{
//    NSLog(@"NSURLSessionDataDelegate----didReceiveData");
//}

@end
