//
//  ViewController.m
//  12.12.00. NSUrlSession
//
//  Created by 张凯泽 on 15/12/12.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Password.h"
@interface ViewController ()<NSURLSessionDataDelegate>



@property(nonatomic,copy)NSString *createPath;//文件夹imge
@property(nonatomic,strong)NSFileManager *fileManager;//文件管理者
@property(nonatomic,copy)NSString *imageSize;//图片的大小
@property(nonatomic,copy)NSString *urlstring;
@property(nonatomic,strong)NSURLSession *session;
@property(nonatomic,strong)NSURLRequest *request;
@property(nonatomic,strong)NSURLSessionDownloadTask *downLoadTask;
@property(nonatomic,strong)NSData *partialData;//
@property (weak, nonatomic) IBOutlet UIImageView *imagView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;//下载进度条
- (IBAction)deleteImage;//删除图片
- (IBAction)deleteFolder;//删除文件夹
@property (weak, nonatomic) IBOutlet UILabel *imageSizeLabel;

@end

@implementation ViewController
//图片的大小
-(NSString *)imageSize
{
    if (_imageSize == nil) {
        NSString *ss = [[self.urlstring MD5] stringByAppendingPathComponent:@".mp4"];
        NSString * path = [NSString stringWithFormat:@"%@/%@", self.createPath,ss];
        unsigned long long imagesize = [[self.fileManager attributesOfItemAtPath:path error:nil]fileSize];
        _imageSize = [NSString stringWithFormat:@"%llu",imagesize];
    }
    return  _imageSize;
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
-(NSString*)urlstring
{
    //"http://zyvideo1.oss-cn-qingdao.aliyuncs.com/zyvd/7c/de/04ec95f4fd42d9d01f63b9683ad0
    if (_urlstring == nil) {//
        _urlstring = [[NSString alloc]initWithFormat:@"%@",@"http://s7.mogujie.cn/b7/bao/131009/q2grx_kqyuotkmkfbgowtwgfjeg5sckzsew_382x485.jpg_468x468.jpg"];
    }
    return _urlstring;
}
-(NSData *)partialData
{
    if (_partialData ==nil) {
        _partialData = [[NSData alloc]init];
        
    }
    return _partialData;
}
- (IBAction)startClick:(UIButton *)sender {
    NSString * path = [NSString stringWithFormat:@"%@/%@", self.createPath,[self.urlstring MD5]];

    if (![self.fileManager fileExistsAtPath:path]) {
        
        self.downLoadTask = [self.session downloadTaskWithRequest:self.request];
        [self.downLoadTask resume];
    }else{
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        self.imagView.image = image;
        self.imagView.contentMode = UIViewContentModeScaleAspectFit;
        self.imagView.hidden = NO;
    }
    
}
- (IBAction)pauseCick:(UIButton *)sender {
    //取消下载任务，把已下载数据存起来
    [self.downLoadTask cancelByProducingResumeData:^(NSData *resumeData) {
        self.partialData = resumeData;
        self.downLoadTask = nil;
    }];
    
}
- (IBAction)resumeClick:(UIButton *)sender {
    if (!self.downLoadTask) {
        //判断是否又已下载数据，有的话就断点续传，没有就完全重新下载
        if (self.partialData) {
            self.downLoadTask = [[self session] downloadTaskWithResumeData:self.partialData];
        }else{
            self.downLoadTask = [[self session] downloadTaskWithRequest:[self request]];
        }
    }
    [self.downLoadTask resume];
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
}
-(NSURLSession *)session
{
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    queue.maxConcurrentOperationCount = 1;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:queue];
    return  session;
}
-(NSURLRequest *)request
{
    NSURL * url = [NSURL URLWithString:@"http://s7.mogujie.cn/b7/bao/131009/q2grx_kqyuotkmkfbgowtwgfjeg5sckzsew_382x485.jpg_468x468.jpg"];
    NSURLRequest *resqust = [NSURLRequest requestWithURL:url];
    return resqust;
}
//创建文件本地保存目录
-(NSURL *)createDirectoryForDownloadItemFromURL:(NSURL *)location
{
    [self.fileManager createDirectoryAtPath:self.createPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSString *ss = [[self.urlstring MD5] stringByAppendingPathComponent:@".mp4"];
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
     NSLog(@"************************didFinishDownloadingToURL****%@",[NSThread currentThread]);
    NSLog(@"downloadTask.response = %@",downloadTask.response);
    NSLog(@"location = %@",location);
    //下载成功后，文件是保存在一个临时目录的，需要开发者自己考到放置该文件的目录
    //NSLog(@"Download success for URL: %@",location.description);
    NSURL *destination = [self createDirectoryForDownloadItemFromURL:location];
    //NSLog(@"destination = %@",destination);
    BOOL success = [self copyTempFileAtURL:location toDestination:destination];
    
    if(success){
        //        文件保存成功后，使用GCD调用主线程把图片文件显示在UIImageView中
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self.fileManager fileExistsAtPath:destination.path]) {
                UIImage *image = [UIImage imageWithContentsOfFile:[destination path]];
                self.imagView.image = image;
                self.imagView.contentMode = UIViewContentModeScaleAspectFit;
                self.imagView.hidden = NO;
                //图片的大小
                self.imageSizeLabel.text = self.imageSize;

            }
        });
    }else{
        NSLog(@"Meet error when copy file");
    }
    self.downLoadTask = nil;
}
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    NSLog(@"****************************%@",[NSThread currentThread]);
    //NSLog(@"response = %@",downloadTask.response.URL);
    NSLog(@"totalBytesExpectedToWrite = %lld",totalBytesExpectedToWrite);
    //刷新进度条的delegate方法，同样的，获取数据，调用主线程刷新UI
    double currentProgress = totalBytesWritten/(double)totalBytesExpectedToWrite;
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress = currentProgress;
        self.progressView.hidden = NO;
    });
}
//删除图片
- (IBAction)deleteImage {
    NSString *ss = [[self.urlstring MD5] stringByAppendingPathComponent:@".mp4"];
    NSString * path = [NSString stringWithFormat:@"%@/%@", self.createPath,ss];
    NSURL * url = [[NSURL alloc]initFileURLWithPath:path];
    NSLog(@"url = %@",url);
    NSError *error;
    BOOL b = [self.fileManager removeItemAtURL:url error:&error];
    if ( b) {
        NSLog(@"delete success");
    }
    else{
        NSLog(@"delete faulse");
    }

}
//删除文件夹
- (IBAction)deleteFolder {
    NSError *error;
    BOOL b = [self.fileManager removeItemAtPath:self.createPath error:&error];
    //NSLog(@"url = %@",url);
    if ( b) {
        NSLog(@"delete success");
    }
    else{
        NSLog(@"delete faulse");
    }

}
//- (float ) folderSizeAtPath:(NSString*) folderPath{
//    NSFileManager* manager = [NSFileManager defaultManager];
//    if (![manager fileExistsAtPath:folderPath]) return 0;
//    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
//    NSString* fileName;
//    long long folderSize = 0;
//    while ((fileName = [childFilesEnumerator nextObject]) != nil){
//        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
//        folderSize += [self fileSizeAtPath:fileAbsolutePath];
//    }
//    return folderSize/(1024.0*1024.0);
//}

@end
