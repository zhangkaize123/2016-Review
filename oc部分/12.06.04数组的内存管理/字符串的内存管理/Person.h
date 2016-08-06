//
//  Person.h
//  字符串的内存管理
//
//  Created by 张凯泽 on 15/12/8.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic,retain)NSArray *name;

-(void)dealloc;

@end
