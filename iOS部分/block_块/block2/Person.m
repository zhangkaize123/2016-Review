//
//  Person.m
//  block_块
//
//  Created by 张凯泽 on 16/6/21.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "Person.h"

@implementation Person
-(mysum)func
{
    
    int base = 100;
    mysum sum = ^ int(int a,int b) {
        return base +a+b;
    };
    NSLog(@"sum --fun%@",sum);
    //return [Block_copy(sum) autorelease];
    return sum;
}
//-(void)setSum7:(mysum)sum7
//{
//    if (_sum7 != sum7) {
//        [_sum7 release];
//        _sum7 = [sum7 copy];
//    }
//}
-(void)dealloc
{
    [super dealloc];
    [_sum7 release];
    
}
@end
