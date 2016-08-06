//
//  main.m
//  12.04.03类的多态
//
//  Created by 张凯泽 on 15/12/4.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Animal.h"
#import "Dog.h"
#import "Cat.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  1.用父类的指针去指向子类。
            2.没有继承就没有多态
         */
        Person * person = [Person new];
        Animal *animal = [Animal new];
        Dog * dog = [Dog new];
        Cat * cat = [Cat new];
        //[person feedcatFood:cat];
        //[person feedogdFood:dog];
#warning mark - zkz 这里使用了多态
        [person feedanimalFood:dog];
//对于子类中特有的方法必须进行类型转化
        Animal * a1 = [Dog new];
        Dog * d1 = (Dog *)a1;
        [d1 jiao];
        
        
    }
    return 0;
}
