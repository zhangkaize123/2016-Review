//
//  main.c
//  函数与数组
//
//  Created by 张凯泽 on 15/11/18.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
int change(int value);
void change1(int array[])//当数组作为函数传递的时候，[]里边的元素个数可以省略
{
    array[0]=88;
}
void change2(int array[])
{
    int count2 = sizeof(array)/sizeof(int);
    printf("change2 size count2 = %lu\n",sizeof(array));
    for (int i = 0; i<count2; i++) {
        printf("array[%d]=%d\n",i,array[i]);
        //ages[0]=88;
    }
}
void change3(int array[],int lenth)
{
    
    
    for (int i = 0; i<lenth; i++) {
        printf("chagne3 array[%d]=%d\n",i,array[i]);
        //ages[0]=88;
    }
}
int main(int argc, const char * argv[]) {
    int number =10;
    int n = change(number);
    printf("n=%d\n",n);
    printf("number=%d\n",number);//在这里number的值还是10，因为作用蜮的原因，传递的是值而不是地址。在swift中也是这样，
    int ages[3] = {1,2,3};
#pragma mark-zkz------用数组作为函数的参数的函数，在函数里修改数组的值，会影响外边的数组的值
    //数组名就是数组的地址。
    change1(ages);
    int count = sizeof(ages)/sizeof(int);
    for (int i = 0; i<count; i++) {
        printf("ages[%d]=%d\n",i,ages[i]);
        //ages[0]=88;
    }
    
    
#warning mark-zkz-
#pragma mark--zkz---当数组作为参数传递的时候是地址传递，所以自动转换成指针类型，指针类型和其他数据类型一样也是占据一定的存储空间，占用8个字节。所以数组无论有多大，它打印只是8个字节的元素。
    int ages1[3]={1,3,5};
    int count2 = sizeof(ages1);
    printf("main size count2 = %d\n",count2);
    change2(ages1);//打印的是1，3但是没有打印5因为指针类型的占用8个字节两个int类型一共占有8个字节，要想全部便利那么就要再传递那个数组的长度。
    change3(ages1,count2/sizeof(int));//在传递数组名（地址）的同时还要传递数组的长度。
    
    return 0;
}
int change(int value)
{
    value=50;
    return value;
}
