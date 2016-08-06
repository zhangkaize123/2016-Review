//
//  Person.h
//  12.04.03类的多态
//
//  Created by 张凯泽 on 15/12/4.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Cat.h"
#import "Animal.h"
@interface Person : NSObject
-(void)feedogdFood:(Dog *)dog;
-(void)feedcatFood:(Cat *)cat;
-(void)feedanimalFood:(Animal *)animal;
@end
