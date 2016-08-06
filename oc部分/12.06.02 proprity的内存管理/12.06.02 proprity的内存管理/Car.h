//
//  Car.h
//  12.06.02 proprity的内存管理
//
//  Created by 张凯泽 on 15/12/6.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
#warning mark--zkz   生成get方法名为 isOpened
@property(nonatomic,assign,getter=isOpened)BOOL opened;

@end
