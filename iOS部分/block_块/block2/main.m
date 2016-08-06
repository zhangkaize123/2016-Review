//
//  main.m
//  block2
//
//  Created by 张凯泽 on 16/6/21.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
#import "Student.h"
typedef void (^ MBlock)();
//Block被另一个Block使用时，另一个Block被copy到堆上时，被使用的Block也会被copy。但作为参数的Block是不会发生copy的。
void far(mysum sum4)
{
    //与上面一样，说明作为参数传递时，并不会发生copy
    NSLog(@"sum4 = %@",sum4);//sum4 = <__NSStackBlock__: 0x7fff5fbff788>
    void (^ blk)(mysum) = ^(mysum sum5){
        //// 无论blk在堆上还是栈上，作为参数的Block不会发生copy。
        NSLog(@"sum5 = %@",sum5);//sum5 = <__NSStackBlock__: 0x7fff5fbff788>
        // 当blk copy到堆上时，sum_blk也被copy了一分到堆上上。
        NSLog(@"-------sum4 = %@",sum4);//-------sum4 = <__NSMallocBlock__: 0x100203ae0>
    };
    //blk(sum4);//// blk在栈上-------sum4 = <__NSStackBlock__: 0x7fff5fbff788>
    blk = [Block_copy(blk) autorelease];
    blk(sum4);// blk在堆上---------sum4 = <__NSMallocBlock__: 0x1002004b0>
}
void foo()
{
    int base = 177;
    mysum sum3 = ^int (int a,int b)
    {
        Person * ppp = [[Person new]autorelease];
        return base + a +b;
    };
    NSLog(@"sum3 = %@",sum3);//sum3 = <__NSStackBlock__: 0x7fff5fbff788>
    far(sum3);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        
        int (^sum)(int, int) = nil;//声明一个block变量
        sum = ^ int(int a,int b){//对变量赋值
            return a+b;
        };
        NSLog(@"sum = %@",sum); //<__NSGlobalBlock__: 0x100001080>
        
         int base = 400;
        mysum sum1 = ^int (int a,int b)
        {
            return base + a + b;
        };
        NSLog(@"sum1 = %@",sum1);//<__NSStackBlock__: 0x7fff5fbff7f0>
        
        mysum sum2 = [Block_copy(sum1) autorelease];
        NSLog(@"sum2 = %@",sum2);//<__NSMallocBlock__: 0x1001008c0>
        __block int base2 = 300;
        mysum sum10 = ^int(int a,int b){
            return base2 +a+b;
        };
        //返回一个block返回值的函数
        Person * p = [[Person alloc]init];
       int aa = [p func](1,2);
        NSLog(@"aa = %d",aa);
        
        foo();
        
        /*
         block在拷贝的时候:
         对于1。全局对象，或者2.使用static 修饰的对象，或者3.使用__block修饰对象，或者4.对象的成员属性（self会＋1） 在 block copy后这些对象的retaincount不会＋1，
         
        5. local 对象会＋1
        6.非ObjC对象，如GCD队列dispatch_queue_t。Block copy时并不会自动增加他的引用计数，这点要非常小心。
         */
         Person * p45 = [[[Person alloc]init]autorelease];
        MBlock mblock = ^{
            NSLog(@"p = %@",p45);
        };
        NSLog(@"---mblock = %@",mblock);
        //mblock();
        NSLog(@"[p retainCount] = %lu",(unsigned long)[p45 retainCount]);
        MBlock mblock1 = [Block_copy(mblock) autorelease];
        NSLog(@"[p retainCount] = %lu",(unsigned long)[p45 retainCount]);
        
        
        /*
         对象d1在sum7被copy到堆上的时候自动retain了一次。因为sum7不知道d1什么时候被释放，为了不在sum7使用obj前被释放，sum7 retain了d1一次，在Block被释放的时候，d1被release一次。
         */
        Dog * d1 = [[Dog new]autorelease];
        Person * p2 = [[Person new]autorelease];
        p2.sum7 = ^int(int a,int b){
            [d1 say];
            NSLog(@"[d1 retainCount] = %lu",(unsigned long)[d1 retainCount]);
            return a +b;
        };
        p2.sum7(4,5);
        
        
        //GCD
        /*
         将Block作为参数传给dispatch_async时，系统会将Block拷贝到堆上，如果Block中使用了实例变量，还将retain self，因为dispatch_async并不知道self会在什么时候被释放，为了确保系统调度执行Block中的任务时self没有被意外释放掉，dispatch_async必须自己retain一次self，任务完成后再release self。但这里使用__block，使dispatch_async没有增加self的引用计数，这使得在系统在调度执行Block之前，self可能已被销毁，但系统并不知道这个情况，导致Block被调度执行时self已经被释放导致crash。
         */
        Student * s = [[Student new]autorelease];
        dispatch_queue_t q = dispatch_queue_create("zkz_ios1", DISPATCH_QUEUE_SERIAL);
        dispatch_async(q, ^{
            [s say];
        });
        NSLog(@"[s retainCount] = %lu",(unsigned long)[s retainCount]);
        Dog * dog = [[[Dog alloc]init]autorelease];
        [dog test];
    }
    typedef int (^blk_t)(int);
    for (int rate = 0; rate < 10; ++rate)
    {
        blk_t blk = ^(int count){return rate * count;};
        NSLog(@"blk = %@",blk);// blk = <__NSStackBlock__: 0x7fff5fbff698>
    }
    return 0;
}
