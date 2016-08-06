//
//  ViewController.m
//  Block_test
//
//  Created by 张凯泽 on 15-8-5.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//
typedef void (^myBlock)(void);
typedef void(^myblock1)(void);
#import "ViewController.h"
#import "ZKZBlockView.h"
int ee = 100;
@interface ViewController ()

- (IBAction)jiehuobianliang:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZKZBlockView *blockView=[[ZKZBlockView alloc]init];
    [self.view addSubview:blockView];
    [blockView selectbutton:^(int a) {
        NSLog(@"%d",a);
    }];
    NSLog(@"************************");
}

- (IBAction)jiehuobianliang:(id)sender {
    /*
     对于 block 外的变量引用，block 默认是将其复制到其数据结构中来实现访问的. 也就是说block的自动变量截获只针对block内部使用的自动变量, 不使用则不截获, 因为截获的自动变量会存储于block的结构体内部, 会导致block体积变大.
     */
    
    /*
     对于用 __block 修饰的外部变量引用，block 是复制其引用地址来实现访问的.
     静态存储区的变量：例如全局变量、方法中的static变量是对其地址进行引用
     引用，可修改。
     */
    static int aaa = 345;
    int a = 10;
    __block int aa = 30;
    myBlock block = ^{
        
        //NSLog(@"_-----%d",a);
        //NSLog(@"_-----%d",aa);
        aaa = aaa -100;
        ee = ee - 10;
    };
    
    //aa = 50;
    block();
    aaa = aaa +1000;
    ee = ee+1000;
    NSLog(@"--------%d",aaa);
    NSLog(@"--------%d",ee);
    typedef int (^blk_t)(int);
    for (int rate = 0; rate < 10; ++rate)
    {
        blk_t blk = ^(int count){return rate * count;};
        NSLog(@"blk = %@",blk);// blk = <__NSMallocBlock__: 0x7869aa20>
    }
    int base22 = 100;
    blk_t bb = ^int(int a){
        return base22;
    };
    bb(44);
    NSLog(@"bb = %@",bb);//bb = <__NSMallocBlock__: 0x7aa6bcb0>
    /*
     在MRC中bb实在栈里，而ARC中bb在堆中。
     
     
     在开启 ARC 时，大部分情况下编译器通常会将创建在栈上的 block 自动拷贝到堆上，只有当
     
     block 作为方法或函数的参数传递时，编译器不会自动调用 copy 方法；
     但方法/函数在内部已经实现了一份拷贝了 block 参数的代码，或者如果编译器自动拷贝，那么调用者就不需再手动拷贝，比如：
     
     当 block 作为函数返回值返回时，编译器自动将 block 作为 _Block_copy 函数，效果等同于 block 直接调用 copy 方法；
     当 block 被赋值给 __strong id 类型的对象或 block 的成员变量时，编译器自动将 block 作为 _Block_copy 函数，效果等同于 block 直接调用 copy 方法；
     当 block 作为参数被传入方法名带有 usingBlock 的 Cocoa Framework 方法或 GCD 的 API 时。这些方法会在内部对传递进来的 block 调用 copy 或 _Block_copy 进行拷贝;
     */
    int aaaa = 100;
    int aaaa1 = 300;
    int aaaa2 = 400;
    myBlock bb1 = ^{
        NSLog(@"%d",aaaa);
    };
    NSLog(@"bb1 = %@",bb1);
    myblock1 bb33 = ^{
        NSLog(@"%d",aaaa);
    };
    NSLog(@"bb3 = %@",bb33);
    myBlock bb2 =^{
        NSLog(@"2--%d",aaaa);
    };
    NSArray * arr = [[NSArray alloc]initWithObjects:bb1, bb2,nil];
    for (myBlock bb in arr) {
        NSLog(@"bbbbb = %@",bb);
    }
}
@end
