//
//  ZKZTableViewCell.m
//  12.12.00. NSUrlSession
//
//  Created by 张凯泽 on 16/4/27.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ZKZTableViewCell.h"

@interface ZKZTableViewCell()
@property(nonatomic,weak)UIImageView *imageView1;
@property(nonatomic,weak)UIProgressView *progressView;
@property(nonatomic,weak)UIButton *button;
@property(nonatomic,weak)UIView *lineview;
@end
@implementation ZKZTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //初始化控件
        //下载的图片
        UIImageView * imageView = [[UIImageView alloc]init];
        imageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:imageView];
        self.imageView1 = imageView;
        //下载的进度
        UIProgressView * progressView = [[UIProgressView alloc]init];
        progressView.progress = 0.0;
        [self.contentView addSubview:progressView];
        self.progressView = progressView;
        UIButton * button = [[UIButton alloc]init];
        button.backgroundColor = [UIColor blueColor];
        [button setTitle:@"下载" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:10];
        [button setTintColor:[UIColor whiteColor]];
        //[button addTarget:self action:@selector(downloadClick:) forControlEvents:UIControlEventTouchUpInside];
        //[self.contentView addSubview:button];
        //self.button = button;
        UIView * lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:lineView];
        self.lineview = lineView;
    }
    return self;

}
-(void)setDownloadData:(ZKZDownloadData *)downloadData
{
    _downloadData = downloadData;
    if (downloadData.isFinishDownLoad) {
        self.progressView.progress = 1.0;
    }else{
        self.progressView.progress = 0.0;
    }
    self.imageView1.image = nil;
    self.imageView1.image = downloadData.image;
    
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView1.frame = CGRectMake(0, 25, 100, 100);
    self.progressView.frame = CGRectMake(105, 75, 100, 2);
    self.button.frame = CGRectMake(230, 65, 70, 20);
    self.lineview.frame = CGRectMake(5,149 , 315, 1);
    
}
@end
