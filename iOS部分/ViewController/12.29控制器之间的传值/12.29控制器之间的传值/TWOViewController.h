//
//  TWOViewController.h
//  12.29控制器之间的传值
//
//  Created by 张凯泽 on 15/12/29.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
@class TWOViewController;
@protocol TWOViewControllerDelegate
@optional
-(void)TWOViewControllerDidAddClickController:(TWOViewController*)viewController andTextName:(NSString*)name;
@end
@interface TWOViewController : ViewController
@property (weak, nonatomic) IBOutlet UITextField *textName;
@property(nonatomic,weak)id<TWOViewControllerDelegate>delegate;
- (IBAction)addClick;

@end
