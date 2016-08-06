//
//  Person.h
//  12.07.01 autorelease 的用法
//
//  Created by 张凯泽 on 15/12/7.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic,assign)int age;
+(instancetype)person;
+(instancetype)personWithAge:(int )age;
-(instancetype)initWithAge:(int )age;
@end
