//
//  Person.h
//  12.04.04点语法
//
//  Created by 张凯泽 on 15/12/4.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
    NSString * _name;
    
}
-(void)setAge:(int)age;
-(void)setName:(NSString*)name;
-(int)age;
-(NSString *)name;
@end
