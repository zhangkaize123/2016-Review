//
//  Card.h
//  12.06.03 循环引用
//
//  Created by 张凯泽 on 15/12/6.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;
@interface Card : NSObject
{
    NSArray * _name;
}
@property(nonatomic,strong)Person *person;
//@property(nonatomic,copy)NSString *name;
-(void)setName:(NSArray*)name;
-(NSArray *)name;
@end
