//
//  ZKZObjTableViewCell.m
//  tableView重复利用cell另一种方法
//
//  Created by 张凯泽 on 16/5/26.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ZKZObjTableViewCell.h"

@implementation ZKZObjTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        NSLog(@"^^^^^^^^^^^^^^^^^^^^^^^^^^");
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
