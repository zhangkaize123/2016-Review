//
//  ViewController.m
//  蓝牙_CoreBluetooth_Peripheral
//
//  Created by 张凯泽 on 16/3/23.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>
static NSString * const kServiceUUID = @"61EFF00E-20E6-46FD-BE48-3E88CB8B0036";
static NSString * const kCharacteristicUUID = @"8E6DFDF2-3F61-4970-9BAB-C28518A60B28";
@interface ViewController ()<CBPeripheralManagerDelegate>
{
    CBPeripheralManager * peripheralm;
    int serviceNum;
    NSTimer * timer;
}
@property (weak, nonatomic) IBOutlet UILabel *info;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    peripheralm = [[CBPeripheralManager alloc]initWithDelegate:self queue:nil];
}
//配置bluetooch的
-(void)setUp{
    //characteristics字段描述
    CBUUID *characteristicUUID = [CBUUID UUIDWithString:kCharacteristicUUID];
   CBMutableCharacteristic* customerCharacteristic = [[CBMutableCharacteristic alloc]initWithType:characteristicUUID properties:CBCharacteristicPropertyNotify value:nil permissions:CBAttributePermissionsReadable];
    CBUUID *serviceUUID = [CBUUID UUIDWithString:kServiceUUID];
    CBMutableService*customerService = [[CBMutableService alloc]initWithType:serviceUUID primary:YES];
    [customerService setCharacteristics:@[customerCharacteristic]];
    //添加后就会调用代理的- (void)peripheralManager:(CBPeripheralManager *)peripheral didAddService:(CBService *)service error:(NSError *)error
    [peripheralm addService:customerService];
}
- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    switch (peripheral.state) {
            //在这里判断蓝牙设别的状态  当开启了则可调用  setUp方法(自定义)
        case CBPeripheralManagerStatePoweredOn:
            NSLog(@"powered on");
            [self.info setText:[NSString stringWithFormat:@"设备名@已经打开，可以使用center进行连接"]];
            [self setUp];
            break;
        case CBPeripheralManagerStatePoweredOff:
            NSLog(@"powered off");
            [self.info setText:@"powered off"];
            break;
        default:
            break;
    }
}



- (void)peripheralManager:(CBPeripheralManager *)peripheral didAddService:(CBService *)service error:(NSError *)error{
    if (error == nil) {
        //添加服务后可以在此向外界发出通告 调用完这个方法后会调用代理的
        //(void)peripheralManagerDidStartAdvertising:(CBPeripheralManager *)peripheral error:(NSError *)error
        [peripheralm startAdvertising:@{CBAdvertisementDataLocalNameKey : @"Service",CBAdvertisementDataServiceUUIDsKey : [CBUUID UUIDWithString:kServiceUUID]}];
    }
    
}
- (void)peripheralManagerDidStartAdvertising:(CBPeripheralManager *)peripheral error:(NSError *)error{
    NSLog(@"in peripheralManagerDidStartAdvertisiong:error");
}


@end
