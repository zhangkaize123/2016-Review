//
//  ViewController.m
//  block_块
//
//  Created by 张凯泽 on 15-3-19.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ViewController.h"
#import "ZKZPerson.h"
int (^ add) (int , int)=^(int a,int b){
    return a+b;
};
typedef int (^ add1) (int , int);
@interface ViewController ()
@property(nonatomic,copy)add1 addd;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZKZPerson * person = [[[ZKZPerson alloc]init]autorelease];
    //[person test];
    
    self.addd = ^(int a,int b){
        return 0;
    };
    /*
     块的声明；定义一个块的变量
     块的定义：返回值 （^块的名字）（参数类型）＝^(参数列表){};
     块的调用:块的名字（参数的值）
     */
    void (^myshow)(void);//定义一个块的变量
    myshow=^{//块的定义
        NSLog(@"hello");
    };
    myshow();//块的调用；
    //1.从1-－－－100相加取值
    int(^ sum)(int)=^(int n){
        int s=0;
        for (int i=1; i<=n; i++) {
            s+=i;
        }
        return s;
    };
    int a=sum (100);
    NSLog(@"sum=%d",a);
    //2.两个数相加-－－－－定义全局的块
    int c=add( 2,5);
    NSLog(@"%d",c);
    int base = 2000;
    add1 asss = ^int(int a,int b) {
        return a + b+base;
    };
    NSLog(@"%@----%d",asss,asss(44,55));//<__NSStackBlock__: 0x7fff5ec71a70>----2099
    add1 asss1 = Block_copy(asss);
    NSLog(@"%@----%d",asss1,asss1(4,5));//<__NSMallocBlock__: 0x7ffed247b560>----2009
    
    
    
    
    //3.使用块
    NSBlockOperation *bo=[NSBlockOperation blockOperationWithBlock:myshow];
    [bo start];
    //3.1或者---匿名块
    NSBlockOperation *bo1=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"wowowoow");
    }];
    [bo1 start];
    

}


@end
