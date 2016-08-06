//
//  main.c
//  11.25指针与字符串
//
//  Created by 张凯泽 on 15/11/25.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    /**
     *  1.字符串的定义方式
     */
    //可变字符串(放到栈里边)栈里边放局部变量有几份变量就有几个内存空间
    char name[4] = "zkz";
     char name3[4] = "zkz";
    printf("name[4] = %p\n",name);//name[4] = 0x7fff5fbff79c
    printf("name3[4] = %p\n",name3);//name3[4] = 0x7fff5fbff798
     //不可变字符串     放到常量区且只有一份能存空间
    char *name1 = "zkz";
    char *name2 ="zkz";
    printf("name1=%p\n",name1);//name1 = 0x100000f86
    printf("name2=%p\n",name2);//name2 = 0x100000f86
    /**
     *  2.字符串数组
     */
    //定义了一个叫做name6的数组，这个数组中将来可以存放2个char * 类型的数据
    char *name6[2] = {
        "zkz",
        "zzk"
    };
    printf("name6=%s\n",*name6);
    return 0;
}
