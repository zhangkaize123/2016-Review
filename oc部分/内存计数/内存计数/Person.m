//
//  Person.m
//  内存计数
//
//  Created by 张凯泽 on 16/7/24.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "Person.h"

@implementation Person
-(instancetype)init
{
    self = [super init];
    if (self) {
        //Student * ss = [[Student alloc]init];
        //_student = ss;
       // NSLog(@"----%ld",[ss retainCount]);
        _timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(timeractionfun) userInfo:nil repeats:YES];
    }
    return self;
}
-(void)timeractionfun
{
    NSLog(@"timeractionfun");
}
-(void)dealloc
{
    [super dealloc];
    //[_student release];
    //[_timer release];
    NSLog(@"person dealloc");
}
@end
