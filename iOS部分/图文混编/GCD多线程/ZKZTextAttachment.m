//
//  ZKZTextAttachment.m
//  GCD多线程
//
//  Created by 张凯泽 on 16/3/9.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ZKZTextAttachment.h"

@implementation ZKZTextAttachment
-(CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex
{
    CGRect rect = CGRectMake(0, 0, 320, 200);
    return rect;
}
@end
