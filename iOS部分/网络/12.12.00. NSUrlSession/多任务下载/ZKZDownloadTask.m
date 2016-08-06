//
//  ZKZDownloadTask.m
//  12.12.00. NSUrlSession
//
//  Created by 张凯泽 on 16/4/28.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ZKZDownloadTask.h"
@interface ZKZDownloadTask()
@property(nonatomic,strong)NSURLSessionDownloadTask * backgroundtask;
@end
@implementation ZKZDownloadTask
-(void)downloadImagedata:(NSString*)urlstring
{
    NSURLRequest * resquest = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:urlstring] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30.0];
    self.backgroundtask= [self.backgroundSession downloadTaskWithRequest:resquest];
    
    [self.backgroundtask resume];

}
-(void)initWithUrlString:(NSString*)urlstring
{
    NSURLRequest * resquest = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:urlstring] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30.0];
    self.backgroundtask= [self.backgroundSession downloadTaskWithRequest:resquest];
    
    [self.backgroundtask resume];

    
}
-(NSURLSession *)backgroundSession
{
//    static NSURLSession *backgroundSession = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
        //NSURLSessionConfiguration * backGroundconfi = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.shinobicontrols.BackgroundDownload.BackgroundSession"];
        NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSOperationQueue * Queue = [[NSOperationQueue alloc]init];
       NSURLSession * backgroundSession = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    //});
    return backgroundSession;

}

#pragma mark----zkz---NSURLSessionDelegate
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    
       
    //NSLog(@"finish download");
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *URLs = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *documentsDirectory = URLs[0];
    
    NSURL *destinationPath = [documentsDirectory URLByAppendingPathComponent:[location lastPathComponent]];
    NSError *error;
    
    // Make sure we overwrite anything that's already there
    [fileManager removeItemAtURL:destinationPath error:NULL];
    BOOL success = [fileManager copyItemAtURL:location toURL:destinationPath error:&error];
    
    if (success)
    {
        NSLog(@"______finshload%@",[NSThread currentThread]);
               dispatch_async(dispatch_get_main_queue(), ^{
            if( [self.delegate respondsToSelector:@selector(ZKZDownloadFinished:)])
       {
           
           [self.delegate ZKZDownloadFinished:[UIImage imageWithContentsOfFile:[destinationPath path]]];
       }

        });
    }
    else
    {
        NSLog(@"Couldn't copy the downloaded file");
    }

}
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
   // NSLog(@"____loading = %@",[NSThread currentThread]);
//    double currentProgress = totalBytesWritten / (double)totalBytesExpectedToWrite;
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(ZKZDownloadProgress:Percentage:)]) {
            NSLog(@"********%f",totalBytesWritten / (double)totalBytesExpectedToWrite);
        [self.delegate ZKZDownloadProgress:totalBytesWritten / (double)totalBytesExpectedToWrite Percentage:0];
    }

    });
    //NSLog(@"________");
    }


@end
