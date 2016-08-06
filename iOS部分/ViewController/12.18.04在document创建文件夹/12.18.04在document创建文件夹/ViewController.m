//
//  ViewController.m
//  12.18.04在document创建文件夹
//
//  Created by 张凯泽 on 15/12/18.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSFileManager *fileManager;//文件管理者
@property(nonatomic,copy)NSString *createPath;//文件夹imge
@property(nonatomic,copy)NSString *createDir;//文件夹MessageQueueImage

- (IBAction)deleteClick:(UIButton *)sender;

@end

@implementation ViewController
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
//创建路径----在document中创建文件夹MessageQueueImage
-(NSString *)createDir
{
    if (_createDir == nil) {
        NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        //NSLog(@"pathDocuments = %@",pathDocuments);
        _createDir = [NSString stringWithFormat:@"%@/MessageQueueImage", pathDocuments];
    }
    return _createDir;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 判断文件夹是否存在，如果不存在，则创建
    if (![self.fileManager fileExistsAtPath:self.createPath]) {
        [self.fileManager createDirectoryAtPath:self.createPath withIntermediateDirectories:YES attributes:nil error:nil];
        //创建文件MessageQueueImage
        [self.fileManager createDirectoryAtPath:self.createDir withIntermediateDirectories:YES attributes:nil error:nil];
       //把字符串写道新创建的文件里边去
        NSString * ss = @"ios";
        NSString * path = [NSString stringWithFormat:@"%@/ios.text", self.createPath];
        BOOL b = [ss writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        if (b) {
            NSLog(@"write string ok");
        }else{
            NSLog(@"write string faluse");
        }

        
    } else {
        NSLog(@"FileDir is exists.");
    }
}

//删除document中的imge文件夹
- (IBAction)deleteClick:(UIButton *)sender {
    if ([self.fileManager fileExistsAtPath:self.createPath]) {
        NSError * error;
        BOOL b = [self.fileManager removeItemAtPath:self.createPath error:&error];
        if ( b) {
            NSLog(@"delete success");
        }
        else{
            NSLog(@"delete faulse");
        }
    }
}
@end
