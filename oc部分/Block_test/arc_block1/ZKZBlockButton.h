//
//  ZKZBlockButton.h
//  Block_test
//
//  Created by 张凯泽 on 16/6/24.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ClickBlock)(id data);
@interface ZKZBlockButton : UIButton
@property(nonatomic,copy)ClickBlock objBlock;

-(instancetype)initWithActionBlock:(ClickBlock)Block;
@end
