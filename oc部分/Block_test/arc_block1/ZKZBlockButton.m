//
//  ZKZBlockButton.m
//  Block_test
//
//  Created by 张凯泽 on 16/6/24.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "ZKZBlockButton.h"
#import <objc/runtime.h>
@implementation ZKZBlockButton
-(instancetype)initWithActionBlock:(ClickBlock)Block
{
    self = [self init];
    [self addTarget:self action:@selector(invoke:) forControlEvents:UIControlEventTouchUpInside];
    [self addActionBlock:Block];
    //[self addTarget:self action:@selector(invoke:)];
    return self;
    
}
-(void)addActionBlock:(ClickBlock)Block
{
    [self setObjBlock:Block];
}
-(void)invoke:(id)sender
{
    //NVMGertureBlock block = objc_getAssociatedObject(self, &target_key);
    if (self.objBlock) {
        self.objBlock(sender);
    }
}
@end
