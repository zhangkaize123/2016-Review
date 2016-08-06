//
//  Iphone.h
//  12.04.02description
//
//  Created by 张凯泽 on 15/12/4.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Iphone : NSObject
{
    int _cup;
    float _size;
    
}
-(void)setCup:(int)cup;
-(void)setSize:(float)size;
-(int)cup;
-(float)size;

@end
