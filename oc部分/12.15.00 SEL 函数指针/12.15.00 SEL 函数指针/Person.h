//
//  Person.h
//  12.15.00 SEL 函数指针
//
//  Created by 张凯泽 on 15/12/15.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic,copy)NSString *name;

-(void)say:(NSString*)name;
@end
