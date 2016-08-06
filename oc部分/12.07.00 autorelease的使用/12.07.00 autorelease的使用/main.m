//
//  main.m
//  12.07.00 autorelease的使用
//
//  Created by 张凯泽 on 15/12/7.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //autorelease 方法会返回对象本身。
        //autorlease 方法会将对象放到自动释放池中。
        //当自动释放池销毁的时候，会对池子里边的对象做一次release 操作。
        //当调用autorelease 方法以后对象的引用计数不会减1.
        //ios 中会创建无数个池子，这些池子都是以栈结构存在（先进后出）
        //当一个对象调用autorelease 方法时，会将这个对象放到栈顶的释放池。
        Person * person = [[[Person alloc]init]autorelease];
        person.array = [[NSMutableArray alloc]init];
        
        NSLog(@"%d",[person.array retainCount]);
        
        
    }
    return 0;
}
