//
//  ZKZPerson.h
//  12.2.01
//
//  Created by 张凯泽 on 15/12/2.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
   kisOpen,
    kisClose
}myStates;
typedef struct {
    float upNum;
    float middleNum;
    float downNum;
    
}mySanwei;
@interface ZKZPerson : NSObject
{
@public
    int age;
    myStates states;
    
}
@property(nonatomic,assign)mySanwei sanWei;
-(void)setAge:(int)age;
@end
