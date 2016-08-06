//
//  ViewController.m
//  12.29控制器之间的传值
//
//  Created by 张凯泽 on 15/12/29.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "TWOViewController.h"
@interface ViewController ()<TWOViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *showLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"_____");
    TWOViewController * tcn = segue.destinationViewController;
    tcn.delegate = self;
}
-(void)TWOViewControllerDidAddClickController:(TWOViewController *)viewController andTextName:(NSString *)name
{
    self.showLabel.text = name;
}
@end
