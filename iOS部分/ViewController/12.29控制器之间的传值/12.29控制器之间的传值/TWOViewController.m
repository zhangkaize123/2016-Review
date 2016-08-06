//
//  TWOViewController.m
//  12.29控制器之间的传值
//
//  Created by 张凯泽 on 15/12/29.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "TWOViewController.h"

@interface TWOViewController ()

@end

@implementation TWOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


- (IBAction)addClick {
    [self.navigationController popToRootViewControllerAnimated:YES];
    
        [self.delegate TWOViewControllerDidAddClickController:self andTextName:self.textName.text];
    
}
@end
