//
//  ViewController.h
//  4.24面试题练习
//
//  Created by 张凯泽 on 16/4/24.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, CYLSex) {
    CYLSexMan,
    CYLSexWoman
};
typedef NS_OPTIONS(NSInteger, ZKZSex){
    ZKZSexMan,
    ZKZSexWoman
};
enum{
    ZKZWeekOne,
    ZKZWeekTwo
};
typedef NSInteger ZKZWeek;
@interface ViewController : UIViewController
@property(nonatomic,assign)CYLSex sex;
@property(nonatomic,assign)ZKZWeek week;
@end

