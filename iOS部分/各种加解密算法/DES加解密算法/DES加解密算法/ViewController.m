//
//  ViewController.m
//  DES加解密算法
//
//  Created by 张凯泽 on 16/1/14.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "DES.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *appPath = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSBundleResolvedPath"];
    NSLog(@"appPath = %@",appPath);
    NSString *_CodeSignaturePath = [appPath stringByAppendingPathComponent:@"_CodeSignature/CodeResources"];
     NSLog(@"_CodeSignaturePath = %@",_CodeSignaturePath);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
