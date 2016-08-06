//
//  ViewController.m
//  12.23利用storyboard实现控制器之间的自动与手动调转
//
//  Created by 张凯泽 on 15/12/23.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)manualClick;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)manualClick {
    //每一条线就是一个segu
    [self performSegueWithIdentifier:@"manualSeg" sender:nil];
}
//执行完suge 后在跳转之前自动执行
//一般给下一个控制器传递数据
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
#pragma mark---zkz-- 具体情况查看博客
}
@end
