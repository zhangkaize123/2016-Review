//
//  ZKZBlockView.m
//  Block_test
//
//  Created by 张凯泽 on 15-8-5.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZBlockView.h"

@implementation ZKZBlockView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(void)selectbutton:(void(^)(int a))blockselect;
{
    //CGFloat delay = 2.0;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 4.登录完毕（请求完毕）
//       
//    });
    blockselect(34567);

    
}

@end
