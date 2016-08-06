//
//  ViewController.m
//  dispatch_semaphore信号量
//
//  Created by 张凯泽 on 16/7/22.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()
@property(nonatomic,strong)dispatch_semaphore_t semap;
@property(nonatomic,strong)NSMutableArray *arrayname;
@end

@implementation ViewController

- (void)viewDidLoad {
    self.arrayname = [[NSMutableArray alloc]init];
    for (int i = 0; i<10; i++) {
        Person * person = [[Person alloc]init];
        [self.arrayname addObject:person];
    }
    [super viewDidLoad];
    self.semap = dispatch_semaphore_create(0);
    /*
     dispatch_semaphore_create(1)
     2016-07-22 15:17:30.321 dispatch_semaphore信号量[44062:1648466] First task starting
     2016-07-22 15:17:31.327 dispatch_semaphore信号量[44062:1648466] First task is done
     2016-07-22 15:17:31.327 dispatch_semaphore信号量[44062:1648465] section task starting
     2016-07-22 15:17:32.330 dispatch_semaphore信号量[44062:1648465] section task is done
     2016-07-22 15:17:32.330 dispatch_semaphore信号量[44062:1648571] three task starting
     2016-07-22 15:17:33.336 dispatch_semaphore信号量[44062:1648571] three task is done
     dispatch_semaphore_create(2)
     2016-07-22 15:18:37.651 dispatch_semaphore信号量[44125:1649462] First task starting
     2016-07-22 15:18:37.651 dispatch_semaphore信号量[44125:1649451] section task starting
     2016-07-22 15:18:38.657 dispatch_semaphore信号量[44125:1649462] First task is done
     2016-07-22 15:18:38.657 dispatch_semaphore信号量[44125:1649451] section task is done
     2016-07-22 15:18:38.658 dispatch_semaphore信号量[44125:1649468] three task starting
     2016-07-22 15:18:39.663 dispatch_semaphore信号量[44125:1649468] three task is done

     */
    //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), {
        //self.task_first()
    //})
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self firstfunc];
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self sectionfunc];
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self threefunc];
//    });
    [self funcc];
}
-(void)funcc{
    dispatch_group_t group = dispatch_group_create();
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i = 0; i < 100; i++)
    {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        dispatch_group_async(group, queue, ^{
            NSLog(@"%i",i);
            sleep(2);
            dispatch_semaphore_signal(semaphore);
        });
    }
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    //dispatch_release(group);
    //dispatch_release(semaphore);
}
-(void)functionname
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    [self.arrayname enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%p------%d",obj,idx);
        dispatch_semaphore_signal(semaphore);//提高信号量+1
    }];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);//降低信号量-1
}
-(void)firstfunc{
   int a1 = dispatch_semaphore_wait(self.semap, DISPATCH_TIME_FOREVER);
    NSLog(@"a1 = %d",a1);
    //NSLog(@"");
    NSLog(@"First task starting");
    sleep(1);
    NSLog(@"First task is done");
    int b1 = dispatch_semaphore_signal(self.semap);
    NSLog(@"b1 = %d",b1);
}
-(void)sectionfunc{
   int a2 = dispatch_semaphore_wait(self.semap, DISPATCH_TIME_FOREVER);
    NSLog(@"a2 = %d",a2);
    NSLog(@"section task starting");
    sleep(1);
    NSLog(@"section task is done");
   int b2 = dispatch_semaphore_signal(self.semap);
    NSLog(@"b2 = %d",b2);
}
-(void)threefunc{
   int a3 = dispatch_semaphore_wait(self.semap, DISPATCH_TIME_FOREVER);
    NSLog(@"a3 = %d",a3);
    NSLog(@"three task starting");
    sleep(1);
    NSLog(@"three task is done");
    int b3 = dispatch_semaphore_signal(self.semap);
    NSLog(@"b3 = %d",b3);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
