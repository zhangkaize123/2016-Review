//
//  ZKZTableViewController.m
//  ASIHTTPRequest应用
//
//  Created by 张凯泽 on 16/5/19.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ZKZTableViewController.h"
#import "ZKZTableViewCell.h"
#import "ZKZDownloadData.h"
#import "ASINetworkQueue.h"
#import "ASIHTTPRequest.h"
#import "NSString+Password.h"
@interface ZKZTableViewController ()<ASIProgressDelegate>
@property(nonatomic,strong)NSFileManager *fileManager;//文件管理者
@property (nonatomic, strong) NSString *cacheFile;
@property(nonatomic,strong)ASINetworkQueue *queue;
@property(nonatomic,strong)NSMutableArray *infoarray;
@end

@implementation ZKZTableViewController
@synthesize accessLock;
//创建文件管理者
-(NSFileManager *)fileManager
{
    if (_fileManager == nil) {
        _fileManager = [NSFileManager defaultManager];
    }
    return _fileManager;
}

- (void)setCacheFile:(NSString *)urlStr
{
    NSString *cacheDir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    urlStr = [urlStr MD5];
    
    _cacheFile = [cacheDir stringByAppendingPathComponent:urlStr];
    NSLog(@"_cacheFile=%@",_cacheFile);
}
-(NSString * )downloadPath:(NSString*)ss
{
    NSString *cacheDir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    ss = [ss MD5];
    return [cacheDir stringByAppendingPathComponent:ss];
}
/**读取文件数据(懒加载)
 */
-(NSArray*)infoarray
{
    //使用模型数组存储数据
    if (_infoarray==nil)
        
    {
        // 1.加载plist
        NSBundle *bundle=[NSBundle mainBundle];
        NSString *path=[bundle pathForResource:@"loadinglist" ofType:@"plist"];
        NSArray *temparray=[NSArray arrayWithContentsOfFile:path];
        // 2.创建模型数组
        NSMutableArray *array=[NSMutableArray array];
        for (NSString *ss in temparray)
        {
            
            //ZKZApp *app=[[ZKZApp alloc]initWithDic:dic];
            ZKZDownloadData *app=[[ZKZDownloadData alloc]init];
            app.urlString = ss;
            app.downloadFileSize = 0;
            app.isFinishDownLoad = NO;
            app.isClickDownLoad = NO;
            [array addObject:app];
            
        }
        // 3.赋值
        _infoarray=array;
        
        
        
    }
    return _infoarray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAccessLock:[[NSRecursiveLock alloc] init]];
    self.queue = [ASINetworkQueue queue];
    NSString *cacheDir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"----%@",cacheDir);
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.infoarray.count;

}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZKZTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[ZKZTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    ZKZDownloadData * data = [self.infoarray objectAtIndex:indexPath.row];
    cell.tag = indexPath.row;
    if (data.isClickDownLoad) {
        if ([self.fileManager fileExistsAtPath:[self downloadPath:data.urlString]]) {//存在该文件
            data.downloadFileSize = [self.fileManager attributesOfItemAtPath:[self downloadPath:data.urlString] error:nil].fileSize;
            //data.image = [UIImage imageWithContentsOfFile:data.urlString.MD5];
            data.image = [UIImage imageWithData:[self.fileManager contentsAtPath:[self downloadPath:data.urlString]]];
            data.isFinishDownLoad = YES;
            //NSLog(@"md5格式路径%@",data.urlString.MD5);
        }else{//不存在d
            data.isFinishDownLoad = NO;
            data.image = nil;
            
        }
        
    }else{//没有被点击
        
    }
    
    
    cell.downloadData = data;
    
    ///NSLog(@"cell.tag = %d",cell.tag);
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150.0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ZKZDownloadData * data = [self.infoarray objectAtIndex:indexPath.row];
    [data setIsClickDownLoad:YES];
    ///网络加载
    NSURL * url = [NSURL URLWithString:data.urlString];
    ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:url];
    request.delegate = self;
    request.downloadProgressDelegate =self;
    [request setDidFinishSelector:@selector(DidFinishRequest:)];
    [request setDidReceiveResponseHeadersSelector:@selector(receiveHeadResponse:)];
    [request setName:data.urlString];
    [request setDidStartSelector:@selector(requestDidStartSelector:)];
    [request startAsynchronous];
    //文件追加
    self.cacheFile = data.urlString;
}

#pragma mark------ZKZTableViewCell 代理方法
-(void)requestDidStartSelector:(ASIHTTPRequest*)request
{
    NSLog(@"requestDidStartSelector--------%@",[NSThread currentThread]);
}
-(void)receiveHeadResponse:(ASIHTTPRequest*)request
{
    NSLog(@"request.responseHeaders = %@----------%@",request.responseHeaders,[NSThread currentThread]);
    for (int index = 0; index<self.infoarray.count; index++) {
        ZKZDownloadData * data = [self.infoarray objectAtIndex:index];
        if ([request.name isEqualToString:data.urlString]) {
            
            [data setContentLenth:[request.responseHeaders objectForKey:@"Content-Length"]];
            
            
        }
        
    }

}
-(void)DidFinishRequest:(ASIHTTPRequest *)request
{
    NSLog(@"DidFinishRequest");
    for (int index = 0; index<self.infoarray.count; index++) {
        ZKZDownloadData * data = [self.infoarray objectAtIndex:index];
        if ([request.name isEqualToString:data.urlString]) {
            [request.responseData writeToFile:[self downloadPath:data.urlString] atomically:YES];
            [data setIsFinishDownLoad:YES];
            
            ZKZTableViewCell * cell = [self.view viewWithTag:index];
            for (UIView * view in cell.contentView.subviews) {
                if ([view isKindOfClass:[UIImageView class]]) {
                    ((UIImageView *)view).image = [UIImage imageWithData:request.responseData];
                    break;
                }
            }
        }
        
    }
    
}

- (void)request:(ASIHTTPRequest *)request didReceiveBytes:(long long)bytes
{
    
    static long long bytess = 0;
    bytess = bytess +bytes;
    NSLog(@"bytess = %lld------length = %lu",bytess,(unsigned long)request.responseData.length);
        for (int index = 0; index<self.infoarray.count; index++) {
            ZKZDownloadData * data = [self.infoarray objectAtIndex:index];
            if ([request.name isEqualToString:data.urlString]) {
                
                //[request.responseData writeToFile:self.cacheFile atomically:NO];
                
                //[self appendData:request.responseData];
                ZKZTableViewCell * cell = [self.view viewWithTag:index];
                for (UIView * view in cell.contentView.subviews) {
                    if ([view isKindOfClass:[UIProgressView class]]) {
                        data.downloadFileSize = request.responseData.length;
                       // NSLog(@"---------%lld",bytess /data.contentLenth.longLongValue);
                        ((UIProgressView*)view).progress = request.responseData.length*1.0 /(data.contentLenth.longLongValue*1.0);
                        break;
                    }
                }
            }
            
        }

    
    
}
-(void)setProgress:(float)newProgress
{
 }
@end
