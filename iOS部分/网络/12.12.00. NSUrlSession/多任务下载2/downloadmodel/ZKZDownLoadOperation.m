//
//  ZKZDownLoadOperation.m
//  12.12.00. NSUrlSession
//
//  Created by 张凯泽 on 16/4/29.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ZKZDownLoadOperation.h"

@interface ZKZDownLoadOperation()<NSURLSessionDataDelegate>

@property(nonatomic,strong)NSURLSessionDownloadTask * backgroundtask2;
//@property(nonatomic,strong)NSURLSession * backgroundSession2;
@end
@implementation ZKZDownLoadOperation
-(instancetype)initWithDownLoadUrlString:(NSString *)urlString
{
    self = [super init];
    if (self) {
        NSURLRequest * resquest = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30.0];
        self.backgroundtask2= [[self backgroundSession2] downloadTaskWithRequest:resquest];
        
        [self.backgroundtask2 resume];
    }
    
    return self;
}
-(NSURLSession *)backgroundSession2
{
//        static NSURLSession *backgroundSession = nil;
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
    //NSURLSessionConfiguration * backGroundconfi = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.shinobicontrols.BackgroundDownload.BackgroundSession"];
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
   // NSOperationQueue * Queue = [[NSOperationQueue alloc]init];
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
//            if ([self.delegate respondsToSelector:@selector(ZKZDownloadFinished:)]) {
//                self.delegate ZKZDownloadFinished:[UIImage ]
//            }
            if( [self.delegate respondsToSelector:@selector(ZKZDownloadFinished2:)])
            {
                
                [self.delegate ZKZDownloadFinished2:[UIImage imageWithContentsOfFile:[destinationPath path]]];
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
    NSLog(@"********%f",totalBytesWritten / (double)totalBytesExpectedToWrite);
    
}


@end
