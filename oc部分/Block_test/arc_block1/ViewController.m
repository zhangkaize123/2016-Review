//
//  ViewController.m
//  arc_block1
//
//  Created by 张凯泽 on 16/6/24.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "ZKZBlockButton.h"
typedef void (^MallocBlock)(id data);
MallocBlock b1;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak id weakSelf = self;
    ZKZBlockButton * blockButton = [[ZKZBlockButton alloc]initWithActionBlock:^(id data) {
        NSLog(@"%@",[weakSelf class]);
    }];
    [blockButton setFrame:CGRectMake(100, 100, 100, 40)];
    blockButton.backgroundColor = [UIColor greenColor];
    //[blockButton setObjBlock:;
//    [blockButton initWithActionBlock:^(id data)
//     {
//         NSLog(@"%@",[weakSelf class]);
//     }];
    [self.view addSubview:blockButton];
    
//    [self test];
//    b1(@1);
//    b1(@2);
    
    
}
//-(void)test
//{
//    id array = [[NSMutableArray alloc]init];
//    __weak id weakArray = array;
//     b1 = ^(id data){
//        
//        [weakArray addObject:data];
//        NSLog(@"%d",[weakArray count]);//0
//    };
//    NSLog(@"%@",b1);
//}


@end
