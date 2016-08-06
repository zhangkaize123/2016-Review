//
//  main.c
//  11.18数组的内存分析
//
//  Created by 张凯泽 on 15/11/18.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    char cs[5];
    /*
     1.数组的地址就是它占用的存储空间最小的字节地址，也就是它第一个元素的地址
     2.每个元素的地址是有规律的，元素地址之间相差数是数组元素类型所占存储空间
     */
    //printf("cs=%p\n",&cs);//cs=0x7fff5fbff78b
    int lenth = sizeof(cs)/sizeof(char);
    for (int i= 0; i<lenth; i++) {
        //printf("cs[%d]=%p\n",i,&cs[i]);
//        cs[0]=0x7fff5fbff78b
//        cs[1]=0x7fff5fbff78c
//        cs[2]=0x7fff5fbff78d
//        cs[3]=0x7fff5fbff78e
//        cs[4]=0x7fff5fbff78f
    }
    int ages[5];
    int lenth1 =sizeof(ages)/sizeof(int);
    for (int i =0; i<lenth1; i++) {
        /*
         ages[0]=0x7fff5fbff780
         ages[1]=0x7fff5fbff784
         ages[2]=0x7fff5fbff788
         ages[3]=0x7fff5fbff78c
         ages[4]=0x7fff5fbff790
         */
         printf("ages[%d]=%p\n",i,&ages[i]);
    }
    
    return 0;
}
