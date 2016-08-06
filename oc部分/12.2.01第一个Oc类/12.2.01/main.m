//
//  main.m
//  12.2.01
//
//  Created by 张凯泽 on 15/12/2.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZKZPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ZKZPerson * person = [[ZKZPerson alloc]init];
        //person -> age = 23;
        [person setAge:22];
        person -> states = kisClose;
        NSLog(@"%d",person ->age);
        mySanwei s ={23,34,45};
        person.sanWei = s;
        NSLog(@"person.sanWei.upNum = %f",person.sanWei.upNum);
        NSLog(@"______%d",person -> age);
        
    }
    return 0;
}
