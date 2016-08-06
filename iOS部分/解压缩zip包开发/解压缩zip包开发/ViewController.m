//
//  ViewController.m
//  解压缩zip包开发
//
//  Created by 张凯泽 on 16/3/9.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "SSZipArchive.h"
@interface ViewController ()
- (IBAction)PressZipClick:(id)sender;
- (IBAction)UnarchiveZipClick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//压缩zip包
- (IBAction)PressZipClick:(id)sender {
    NSArray *pngs = [[NSBundle mainBundle] pathsForResourcesOfType:@"png" inDirectory:nil];
    
    // zip文件路径
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *zipFilepath = [caches stringByAppendingPathComponent:@"pngs.zip"];
    NSLog(@"zipFilepath = %@",zipFilepath);
    
    // 创建zip文件
    //[SSZipArchive createZipFileAtPath:zipFilepath withFilesAtPaths:pngs];
    [SSZipArchive createZipFileAtPath:zipFilepath withFilesAtPaths:pngs withPassword:@"zkz"];
}
 //解zip包
- (IBAction)UnarchiveZipClick:(id)sender {
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filepath = [caches stringByAppendingPathComponent:@"pngs.zip"];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 解压(文件大, 会比较耗时，所以放到子线程中解压)
        //[SSZipArchive unzipFileAtPath:filepath toDestination:caches];
        NSError * error;
        [SSZipArchive unzipFileAtPath:filepath toDestination:caches overwrite:YES password:@"zkz" error:&error];
        NSLog(@"error = %@",error);
        NSLog(@"解压完成");
    });
}
@end
