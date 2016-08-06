//
//  main.m
//  arc_block
//
//  Created by 张凯泽 on 16/6/24.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^ GlobalBlock) (id data);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray * arr = [[NSMutableArray alloc]init];
       id __weak weakArr = arr;
        GlobalBlock block1 = ^(id data){
            //[weakArr addObject:data];
            NSLog(@"%@",data);
            //NSLog(@"%lu",(unsigned long)[arr count]);
        };
        NSLog(@"%@",block1);
        block1(@1);
        block1(@2);
    
    }
    return 0;
}
