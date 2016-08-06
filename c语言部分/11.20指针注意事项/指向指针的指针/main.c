//
//  main.c
//  指向指针的指针
//
//  Created by 张凯泽 on 15/11/21.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
#pragma mark--zkz---指向指针的指针
    /*
     1.&a = 0x7fff5fbff7ac
     
     2.p =  0x7fff5fbff7ac
     
     3.&p = 0x7fff5fbff7a0
     
     4.*pp=0x7fff5fbff7ac
     
     5.&(*pp)=0x7fff5fbff7a0
     6.pp=0x7fff5fbff7a0
     
     7.&pp=0x7fff5fbff798
     8.**ppp=0x7fff5fbff7a0
*/
    int a = 10;
    int * p = &a;
    int **pp = &p;
    
    int ***ppp = &pp;
   printf("1.&a = %p\n",&a);
   printf("2.p =  %p\n",p);
   printf("3.&p = %p\n",&p);
    
    printf("4.*pp=%p\n",*pp);
    
   printf("5.&(*pp)=%p\n",&(*pp));
    printf("6.pp=%p\n",pp);
    printf("7.&pp=%p\n",&pp);
    printf("8.**ppp=%p\n",*ppp);
    /*
     *p == a
     *pp == p
     **pp == *p == a
     
     1. &a = 0x7fff5fbff7ac
     2. p =  0x7fff5fbff7ac
     3. &p = 0x7fff5fbff7a0
     4. *pp =0x7fff5fbff7ac//取pp指针，指向的那块空间保存的值（a的地址）
     5. &(*pp)=0x7fff5fbff7a0//取pp指向的空间，里边保存的地址它所在这个空间的地址
     6. pp=0x7fff5fbff7a0
     */
    **pp=30;
    printf("a = %d\n",a);
    return 0;
}
