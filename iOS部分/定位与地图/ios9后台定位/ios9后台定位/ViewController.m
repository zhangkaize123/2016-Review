//
//  ViewController.m
//  ios9后台定位
//
//  Created by 张凯泽 on 16/1/13.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<CLLocationManagerDelegate>
@property(nonatomic,strong)CLLocationManager *locationManager;
@end

@implementation ViewController
-(CLLocationManager *)locationManager
{
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位不可用");
        return nil;
    }
    if (_locationManager == nil) {
        _locationManager = [[CLLocationManager alloc]init];
    }
    return _locationManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSThread sleepForTimeInterval:4];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter=100;
    //定位的精确度
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //3.进行认证
    if ([[UIDevice currentDevice] systemVersion].doubleValue>8.0) {
        if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
            //前台，后台都可定位
            [self.locationManager requestAlwaysAuthorization];
        }
    }
    if ([[UIDevice currentDevice] systemVersion].doubleValue>9.0) {
        self.locationManager.allowsBackgroundLocationUpdates = YES;
    }

    //开始定位
    [self.locationManager startUpdatingLocation];
    
    
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    NSLog(@"%@",locations.firstObject);
    //停止定位
    //[self.locationManager stopUpdatingLocation];
}


@end
