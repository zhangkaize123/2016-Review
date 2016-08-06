//
//  ViewController.m
//  蓝牙传送_多点链接_发现
//
//  Created by 张凯泽 on 16/2/21.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import <MultipeerConnectivity/MultipeerConnectivity.h>
@interface ViewController ()<MCSessionDelegate,MCBrowserViewControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
- (IBAction)discoverBtn:(id)sender;
- (IBAction)selectImage:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;
- (IBAction)sendImage:(id)sender;
@property(nonatomic,strong)MCSession *session;
@property(nonatomic,strong)MCBrowserViewController *browser;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//发现
- (IBAction)discoverBtn:(id)sender {
    //创建代表当前蓝牙设备的对象，并设备显示在对方设备的名字
    MCPeerID * peer = [[MCPeerID alloc]initWithDisplayName:@"zkz_client"];
    //创建连接
    MCSession * session = [[MCSession alloc]initWithPeer:peer];
    session.delegate = self;
    self.session = session;
    //创建发现的控制器，服务类型必须和广播的类型完全一致
    MCBrowserViewController * browser = [[MCBrowserViewController alloc]initWithServiceType:@"zkz-chat" session:session];
    browser .delegate=self;
    [self presentViewController:browser animated:YES completion:nil];
    
}
//选择本地相册图片
- (IBAction)selectImage:(id)sender {
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}
//发送照片
- (IBAction)sendImage:(id)sender {
    [self.session sendData:UIImagePNGRepresentation(self.showImageView.image) toPeers:self.session.connectedPeers withMode:MCSessionSendDataReliable error:nil];
}
#pragma mark--zkz--MCSessionDelegate的代理方法
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
            break;
        default:
            NSLog(@"连接失败");
            break;
    }
}

// Received data from remote peer.
//接受其他蓝牙设备传递过来的数据
- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    NSLog(@"data");
    NSString * ss = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ss = %@",ss);
    self.showLabel.text = ss;
    
    self.showImageView.image = [[UIImage alloc]initWithData:data];
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
#pragma mark--zkz--MCBrowserViewControllerDelegate
//关闭发现控制器
-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
    [browserViewController dismissViewControllerAnimated:YES completion:nil];
}
-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
    [browserViewController dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark---zkz---  图片选择的代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    self.showImageView.image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
