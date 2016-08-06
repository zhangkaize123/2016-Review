//
//  Observer.h
//  notification与多线程
//
//  Created by 张凯泽 on 16/7/18.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Poster.h"
@interface Observer : NSObject
{
    Poster  *_poster;
}
@property (nonatomic, assign) NSInteger i;
@end
