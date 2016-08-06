//
//  main.m
//  12.06.00多个对象的内存管理
//
//  Created by 张凯泽 on 15/12/6.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Book.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         在proprity属性中set方法与非arc 重写set方法一样，都是以下情况:
         
         -(void)setBook:(Book *)book
         {
         if (book != _book) {
         [_book release];
         _book = [book retain];
         }
         
         }
         */
        Book * b = [[Book alloc]init];
        //Book * b1 = [[Book alloc]init];
        Person * p = [[Person alloc]init];
        
        //p.book = b;
        [p setBook:b];
        NSLog(@"1 = %d",[b retainCount]);
        //b = nil;
       // p.book = b1;
        [p setBook:b];
         NSLog(@"2 = %d",[b retainCount]);
        //[p setBook:b1];
       [b release];
         NSLog(@"3 = %d",[b retainCount]);
        //[b1 release];
        //b1 = nil;
        //NSLog(@"_____%d",[b retainCount]);
        
        
        [p release];
        p = nil;
        
    }
    return 0;
}
