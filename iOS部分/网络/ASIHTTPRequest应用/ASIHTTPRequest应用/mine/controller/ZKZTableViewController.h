//
//  ZKZTableViewController.h
//  ASIHTTPRequest应用
//
//  Created by 张凯泽 on 16/5/19.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZKZTableViewController : UITableViewController
{
    // Mediates access to the cache
   
}
@property(nonatomic,strong) NSRecursiveLock *accessLock;;
@end
