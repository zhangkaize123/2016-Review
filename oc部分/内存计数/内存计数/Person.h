//
//  Person.h
//  内存计数
//
//  Created by 张凯泽 on 16/7/24.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
@interface Person : NSObject
@property(nonatomic,strong)Student *student;
@property(nonatomic,strong)NSTimer *timer;
@end
