//
//  ViewController.m
//  使用NSUrlSession实现后台下载功能
//
//  Created by 张凯泽 on 16/3/10.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()<NSURLSessionDownloadDelegate>
- (IBAction)BackGoundDownloadClick;
@property(nonatomic,strong)NSOperationQueue *Queue;
@property(nonatomic,strong)NSURLRequest *resquest;
@property(nonatomic,strong)NSURL *url;
@property(nonatomic,strong)NSURLSession *backgroundSession;
@property(nonatomic,strong)NSURLSessionDownloadTask * backgroundtask;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Queue = [[NSOperationQueue alloc]init];
    
}/*
    */

//http://zyvideo1.oss-cn-qingdao.aliyuncs.com/zyvd/7c/de/04ec95f4fd42d9d01f63b9683ad0
//设置url
-(NSURL*)url
{
    if (_url == nil) {
        _url = [[NSURL alloc]initWithString:@"http://yinyueshiting.baidu.com/data2/music/5a94326d200d1d552c4c4ff41f6764c6/99542054/99542054.mp3?xcode=f31e44018bb10b3939ce60c9b3abe9ef"];
    }
    return _url;
}
//使用get方式设置请求
-(NSURLRequest*)resquest
{
    if (_resquest == nil) {
        _resquest = [[NSURLRequest alloc]initWithURL:self.url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30.0];
    }
    NSLog(@"_resquest = %@",_resquest);
    return _resquest;
}
-(NSURLSession *)backgroundSession
{
    [NSThread sleepForTimeInterval:30];
    static NSURLSession *backgroundSession = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration * backGroundconfi = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.shinobicontrols.BackgroundDownload.BackgroundSession"];
        //NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];

            backgroundSession = [NSURLSession sessionWithConfiguration:backGroundconfi delegate:self delegateQueue:self.Queue];
    });
    return backgroundSession;
}
//后台下载功能
- (IBAction)BackGoundDownloadClick {
    //[NSThread sleepForTimeInterval:60.0];
   self.backgroundtask= [self.backgroundSession downloadTaskWithRequest:self.resquest];
    
    [self.backgroundtask resume];
}
#pragma mark----zkz---NSURLSessionDelegate
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSLog(@"finish download");
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *URLs = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *documentsDirectory = URLs[0];
    
    NSURL *destinationPath = [documentsDirectory URLByAppendingPathComponent:[location lastPathComponent]];
    NSLog(@"destinationPath = %@",destinationPath);
    NSError *error;
    
    // Make sure we overwrite anything that's already there
    [fileManager removeItemAtURL:destinationPath error:NULL];
    BOOL success = [fileManager copyItemAtURL:location toURL:destinationPath error:&error];
    
    if (success)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithContentsOfFile:[destinationPath path]];
            self.imageView.image = image;
            self.imageView.contentMode = UIViewContentModeScaleAspectFill;
            self.imageView.hidden = NO;
        });
    }
    else
    {
        NSLog(@"Couldn't copy the downloaded file");
    }

    if (session == self.backgroundSession) {
        self.backgroundtask = nil;
        AppDelegate * appdelegate=[UIApplication sharedApplication].delegate;
        if (appdelegate.backgroundTransferCompletionHandler) {
            void (^handler)() = appdelegate.backgroundTransferCompletionHandler;
            appdelegate.backgroundTransferCompletionHandler = nil;
            //NSLog(@"finish handler");
            
            handler();
        }
    }
}
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    double currentProgress = totalBytesWritten / (double)totalBytesExpectedToWrite;
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.hidden = NO;
        self.progressView.progress = currentProgress;
    });
    NSLog(@"________");
}



@end
