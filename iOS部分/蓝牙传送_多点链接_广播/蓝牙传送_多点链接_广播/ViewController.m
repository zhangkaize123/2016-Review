//
//  ViewController.m
//  蓝牙传送_多点链接_广播
//
//  Created by 张凯泽 on 16/2/21.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import <MultipeerConnectivity/MultipeerConnectivity.h>
@interface ViewController ()<MCSessionDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
- (IBAction)selectPhoto:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
- (IBAction)sendPhoto:(id)sender;
@property(nonatomic,strong)MCSession *session;
@property(nonatomic,strong)MCAdvertiserAssistant *assistant;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建表示当前蓝牙设备的对象并设置广播的名字
    MCPeerID *peer = [[MCPeerID alloc]initWithDisplayName:@"zkz_blue_server"];//
    //创建连接
    MCSession * session = [[MCSession alloc]initWithPeer:peer];
    session.delegate = self;
    self.session = session;
    
    
    //创建广播助手用来广播当前的蓝牙设备的,必须制定一个蓝牙服务不能超过12个字符,只能使用ASCII中的字符
    MCAdvertiserAssistant * assistant = [[MCAdvertiserAssistant alloc]initWithServiceType:@"zkz-chat" discoveryInfo:nil session:session];
    self.assistant = assistant;
    //开始广播
    [assistant start];
    
}
-(void)dealloc
{
    //停止广播
    [self.assistant stop];
}

//从相册中选择图片
- (IBAction)selectPhoto:(id)sender {
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}
//向对方的蓝牙设备发送图片
- (IBAction)sendPhoto:(id)sender {
    //获取图片的二进制数据
    if (self.photoImage.image) {
       // NSData * data = UIImagePNGRepresentation(self.photoImage.image);
        NSString * ss = @"hello";
        NSData * data = [ss dataUsingEncoding:NSUTF8StringEncoding];
        //发送数据、
        [self.session sendData:data toPeers:self.session.connectedPeers withMode:MCSessionSendDataReliable error:nil];

    }else{
        NSLog(@"没有图片");
    }
        
}
#pragma mark--zkz--MCSession的代理方法
// Remote peer changed state.
//监听用来判断两台蓝牙设备之间的连接状态的变化
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{
    switch (state) {
        case MCSessionStateConnecting:
            NSLog(@"正在连接");
            break;
        case MCSessionStateConnected:
            NSLog(@"已经连接成功");
            self.showLabel.text = @"已经连接成功";
            break;
        default:
            NSLog(@"连接失败");
            self.showLabel.text = @"连接失败";
            
            break;
    }
}

// Received data from remote peer.
//接受其他蓝牙设备传递过来的数据
- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    NSLog(@"data-------");
    self.photoImage.image = [[UIImage alloc]initWithData:data];
}

// Received a byte stream from remote peer.
- (void)    session:(MCSession *)session
   didReceiveStream:(NSInputStream *)stream
           withName:(NSString *)streamName
           fromPeer:(MCPeerID *)peerID
{
    
}

// Start receiving a resource from remote peer.
- (void)                    session:(MCSession *)session
  didStartReceivingResourceWithName:(NSString *)resourceName
                           fromPeer:(MCPeerID *)peerID
                       withProgress:(NSProgress *)progress
{
    
}

// Finished receiving a resource from remote peer and saved the content
// in a temporary location - the app is responsible for moving the file
// to a permanent location within its sandbox.
- (void)                    session:(MCSession *)session
 didFinishReceivingResourceWithName:(NSString *)resourceName
                           fromPeer:(MCPeerID *)peerID
                              atURL:(NSURL *)localURL
                          withError:(nullable NSError *)error
{
    
}
#pragma mark---zkz---  图片选择的代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    self.photoImage.image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
