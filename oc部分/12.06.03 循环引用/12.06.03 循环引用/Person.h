//
//  Person.h
//  12.06.03 循环引用
//
//  Created by 张凯泽 on 15/12/6.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Card;
@interface Person : NSObject
@property(nonatomic,assign)Card *card;
@end
