//
//  ZKZDog.h
//  block_块
//
//  Created by 张凯泽 on 16/6/22.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^blk_t)(void);
@interface ZKZDog : NSObject
{
    blk_t blk_;
}
- (void)execBlock;
@end
