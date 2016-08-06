//
//  ViewController.m
//  12.22.00UIAlertController
//
//  Created by 张凯泽 on 15/12/22.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)jumpClick;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jumpClick {
    NSString *title = @"是否要退出程序";
    NSString *message = @"退出程序后下次登录会自动更新数据";
    NSString *cancelButtonTitle = @"取消";
    NSString *otherButtonTitle =@"确定";
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
    }];
    //UIAlertActionStyleDestructive 字体为红色字体系统默认
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"The \"Okay/Cancel\" alert's other action occured.");
    }];
    
    // Add the actions.
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}
@end
