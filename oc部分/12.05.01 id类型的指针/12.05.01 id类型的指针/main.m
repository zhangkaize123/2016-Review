//
//  main.m
//  12.05.01 id类型的指针
//
//  Created by 张凯泽 on 15/12/5.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    
    NSObject * p = [Person new];
    Person * p1 = (Person *)p;
    p1.age = 30;
    NSLog(@"%d",p1.age);
    id p2 = [Person new];
    [p2 setAge:45];
    NSLog(@"%d",[p2 age]);
    /*
    id 的本质是： typedef struct objc_object *id;
     用id类型接收一个对象，调用对象的特有方法不用进行强制转化
     */
    
        return 0;
}
