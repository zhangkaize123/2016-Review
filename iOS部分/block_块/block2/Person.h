//
//  Person.h
//  block_块
//
//  Created by 张凯泽 on 16/6/21.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef int (^mysum) (int,int);
typedef void(^MyBlock) ();
@interface Person : NSObject
@property(nonatomic,copy)mysum sum7;

-(mysum)func;
//-(void)setSum7:(mysum)sum7;
@end
