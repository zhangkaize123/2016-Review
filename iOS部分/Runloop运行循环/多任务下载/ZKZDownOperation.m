//
//  ZKZDownOperation.m
//  Runloop运行循环
//
//  Created by 张凯泽 on 16/4/26.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ZKZDownOperation.h"
#import "NSString+Password.h"
@interface ZKZDownOperation()
@property(nonatomic,strong)NSOperationQueue *Queue;
@end
@implementation ZKZDownOperation
-(instancetype)initWithUrlString:(NSString*)urlString andDownloadDelegate:(id<NSURLSessionDataDelegate>)delegate
{
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:queue];
    
}
//创建文件管理者
-(NSFileManager *)fileManager
{
    if (_fileManager == nil) {
        _fileManager = [NSFileManager defaultManager];
    }
    return _fileManager;
}
//创建路径----在document中创建文件夹imge
-(NSString *)createPath
{
    if (_createPath == nil) {
        NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSLog(@"pathDocuments = %@",pathDocuments);
        _createPath = [NSString stringWithFormat:@"%@/Image", pathDocuments];
    }
    return _createPath;
}

//创建文件本地保存目录
-(NSURL *)createDirectoryForDownloadItemFromURL:(NSURL *)location
{
    [self.fileManager createDirectoryAtPath:self.createPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSString *ss = [[self.urlstring MD5] stringByAppendingPathComponent:@"images"];
    NSString * path = [NSString stringWithFormat:@"%@/%@", self.createPath,ss];
    NSLog(@"path = %@",path);
    return [[NSURL alloc]initFileURLWithPath:path];
}
//把文件拷贝到指定路径
-(BOOL) copyTempFileAtURL:(NSURL *)location toDestination:(NSURL *)destination
{
    
    NSError *error;
    //    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([self.fileManager fileExistsAtPath:destination.path]) {
        [self.fileManager removeItemAtURL:destination error:NULL];
    }
    
    [self.fileManager copyItemAtURL:location toURL:destination error:&error];
    if (error == nil) {
        return true;
    }else{
        NSLog(@"%@",error);
        return false;
    }
}

#pragma mark NSURLSessionDownloadDelegate

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location
{
    
}
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    
}

@end
