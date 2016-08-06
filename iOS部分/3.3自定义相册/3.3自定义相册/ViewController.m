//
//  ViewController.m
//  3.3自定义相册
//
//  Created by 张凯泽 on 16/3/3.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "ZKZGroupViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
@interface ViewController ()
- (IBAction)AlbumButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *PhotoScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AlbumButton:(UIButton *)sender {
    
    ZKZGroupViewController * GroupVC = [[ZKZGroupViewController alloc]initWithStyle:UITableViewStylePlain];
    GroupVC.mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeMovie];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:GroupVC];
    [self presentViewController:nav animated:YES completion:nil];
}
@end
