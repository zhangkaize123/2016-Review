//
//  main.c
//  位运算
//
//  Created by 张凯泽 on 15/11/17.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
#pragma mark-zkz---按位与&
    int result = 9 & 5;
    /*
     9 :    1001
     &
     5 :    0101
     -------0001----->1
     1.按位与：只有对应的  两位都是1  才返回1，否则返回0
     口诀：一假则假
     */
    printf("result＝%d\n",result);
#pragma mark-zkz---按位或 ｜
    int result1 = 9 | 5;
    /*
     9 :    1001
     |
     5 :    0101
     -------1101----->13
     特点：只要有一个是1就是1
     口诀：一真则真
     */
    printf("result1＝%d\n",result1);
 #pragma mark-zkz---按位异或^
    int result2 = 9 ^ 5;
    /*
     9 :    1001
     ^
     5 :    0101
     
     -------1100----->12
     int result2 = 9 ^ 5 ^ 3;
     int result2 = 5 ^ 3 ^ 9;
     结论：1.多个整数按位异或结果和顺序没有关系
           int result2 = 9 ^ 9 ;-－－》0
          2.相同整数按位异或 结果为0
           int result2 = 9 ^ 0;－－》9
          3.任何整数按位异或上0结果还是那个整数
           int result2 = 9 ^ 0;
           int result2 = 9 ^ 5 ^ 9
     特点：对应的两位不同返回1，相同返回0
     */
    printf("result2=%d\n",result2);
    int result3 = -9 ^ 5;
    printf("result3=%d\n",result3);
    //-9
    //   1000 0000 0000 0000 0000 0000 0000 1001(原码)－－－》－9
    //   1111 1111 1111 1111 1111 1111 1111 0110(反码)
    //   1111 1111 1111 1111 1111 1111 1111 0111(补码)
    //   0000 0000 0000 0000 0000 0000 0000 0101－－－－》5
    //   1111 1111 1111 1111 1111 1111 1111 0010
    
    
    
    
    
    
    return 0;
}
