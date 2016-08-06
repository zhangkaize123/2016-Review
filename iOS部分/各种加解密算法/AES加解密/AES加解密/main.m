//
//  main.m
//  AES加解密
//
//  Created by 张凯泽 on 16/1/13.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AES.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
    NSString * keyValue = @"张凯泽zkz";
       // NSLog(@"%d",sizeof(<#expression-or-type#>));
        NSData * keyData = [keyValue dataUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%d",sizeof(keyData));
        NSString * ivValue = @"张凯泽abc";
        NSData * ivData = [ivValue dataUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%d",sizeof(keyData));
        NSString * encrityValue = @"zhangkaize";
        NSData * encrityData = [encrityValue dataUsingEncoding:NSUTF8StringEncoding];
        NSData * encrydata = [encrityData AES256EncryptWithKey:keyData iv:ivData];
        NSLog(@"%@",encrydata);
        NSData * decryptData = [encrydata AES256DecryptWithKey:keyData iv:keyData];
       NSLog(@"%@", [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding]);
    }
    return 0;
}
