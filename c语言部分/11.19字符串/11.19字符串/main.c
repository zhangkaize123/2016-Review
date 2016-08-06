//
//  main.c
//  11.19字符串
//
//  Created by 张凯泽 on 15/11/19.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
#include <string.h>
int main(int argc, const char * argv[]) {
    
    char name[10] = "name";
    printf("name = %s \n",name);
    
#pragma mark-zkz--字符串的初始化
    
    char name1[10] = "lee";//"\n"是字符串结束的标志
    char name2[10] = {'l','e','e','\n'};//如果通过该方式必须加上"\0", "\0"的ASCII是 0
    printf("name2=%s",name2);
    char name5[] = "lee";
    #warning mark--zkz---该方式 是 字符串
    char name4[4] = {'l','e','e'};
#warning mark--zkz---该方式 不是 字符串
    char name3[3] = {'l','e','e'};//这种方式  不是  字符串
    char name8[] = {'n','a','m','e'};//这种方式  不是  字符串
    
#pragma mark-zkz---字符串的注意事项
    
    char name6[] = "name";
    char name7[] = {'l','y','t','r'};
    //%s 本质就是根据传入的name的地址逐个去取数组中的元素然后输出，直到遇到“\0”位置。
    printf("name6=%s\n",name6);
    printf("name7=%s\n",name7);//会发生脏读。
    printf("_____%lu\n",sizeof(name7)/sizeof(char));
    
#pragma mark-zkz---字符串的常用方法
    //1.strlen(<#const char *#>)计算字符串长度，也就是计算的是字符数，计算的结果不包括“0”
    //原理：逐个的取出字符串的字符，如果不是“\0”就加1
    char name10[] = "name";//strlen是4
#warning mark-zkz-------这里要注意
    char name9[] = {'l','y','t','r'};//strlen是7
    //2.字符串的拼接
    char n[10] = "less";
    char n2[4] = "rr";
    printf("何必昂%s\n",strcat(n,n2 ));
    //字符串的比较
    char c[10] = "abcd";
    char c1[10] = "abcf";
    size_t count = 4;
    int com = strncmp(c1, c, count);
    printf("com=%d\n",com);
    return 0;
}
