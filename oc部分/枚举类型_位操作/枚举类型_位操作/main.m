//
//  main.m
//  枚举类型_位操作
//
//  Created by 张凯泽 on 16/7/6.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, Test)
{
    TestA       = 1,      //1   1   1
    TestB       = 1 << 1, //2   2   10      转换成 10进制  2
    TestC       = 1 << 2, //4   3   100     转换成 10进制  4
    TestD       = 1 << 3, //8   4   1000    转换成 10进制  8
    TestE       = 1 << 4  //16  5   10000   转换成 10进制  16
};
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        typedef NS_ENUM(uint, Test)
        {
            TestA,
            TestB,
            TestC,
            TestD,
            TestE
        };
        Test tes = (TestA|TestB);
        NSLog(@"%d %d %d %d %d",TestA,TestB,TestC,TestD,TestE);
        //Test tes = (TestA|TestB);
        NSLog(@"%d",tes);
        NSLog(@"%d",(tes & TestA));
        
        if ((tes & TestA)) {
            NSLog(@"有");
        }else
        {
            NSLog(@"没有");
        }
        NSLog(@"%d",(tes & TestB));
        if ((tes & TestA)) {
            NSLog(@"有");
        }else
        {
            NSLog(@"没有");
        }
        
        NSLog(@"%d",(tes & TestC));
        if ((tes & TestC)) {
            NSLog(@"有");
        }else
        {
            NSLog(@"没有");
        }
        if ((tes & TestB)) {
            NSLog(@"有1");
        }else{
            NSLog(@"没有");
        }
        
        
        
        int a = 10;
        int b = 34;
        a |= b;
        printf("a = %d\n",a);

    }
    return 0;
}
