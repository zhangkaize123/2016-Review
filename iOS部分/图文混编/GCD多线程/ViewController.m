//
//  ViewController.m
//  GCD多线程
//
//  Created by 张凯泽 on 16/3/9.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "ZKZTextAttachment.h"
@interface ViewController ()<UITextViewDelegate>
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UITextView * textView = [[UITextView alloc]initWithFrame:self.view.frame];
    textView.delegate = self;
    [self.view addSubview:textView];
    //textView.userInteractionEnabled = NO;
    ZKZTextAttachment * attachment = [[[ZKZTextAttachment alloc]init]init];
    attachment.image = [UIImage imageNamed:@"1.png"];
    NSMutableAttributedString * attachmentString = (NSMutableAttributedString *)[NSAttributedString attributedStringWithAttachment:attachment];
    [textView.textStorage appendAttributedString:attachmentString];
    
    NSAttributedString * attachmentString1 = [[NSAttributedString alloc]initWithString:@"我饿我饿隔日 i 个本日 ver 好哦围观喝哦让别人弄不好v 会玩弄别惹您别人v 饿噢人不会热哦不容v 我呢热播如同被 one 女保暖热播女人旅呢哦日本呢肉搏王府井沛公就碰上个人评价饿哦让格局哦尔和包容他不会肉片；电话费都多家品牌非得哦 if 和哦哦的非农尔附近包容他人就播饿啊跑哦嗯热播耳机"];
    [textView.textStorage appendAttributedString:attachmentString1];
    
    
}
-(BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange
{
    NSLog(@"___________");
    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
@end
