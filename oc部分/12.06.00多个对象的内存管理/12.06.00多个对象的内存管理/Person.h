//
//  Person.h
//  12.06.00多个对象的内存管理
//
//  Created by 张凯泽 on 15/12/6.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
@interface Person : NSObject
@property(nonatomic,strong)Book *book;
@end
