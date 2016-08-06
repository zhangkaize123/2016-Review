//
//  ViewController.m
//  多任务下载
//
//  Created by 张凯泽 on 16/4/27.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "ZKZTableViewCell2.h"
#import "ZKZDownloadData.h"
#import "ZKZDownLoadOperation.h"
#import "ZKZDownLoadManager.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,ZKZTableViewCelldelegate>
@property(nonatomic,strong)NSMutableArray *infoarray;
@property(nonatomic,weak)UITableView *tableView;
@end

@implementation ViewController
/**读取文件数据(懒加载)
 */
-(NSArray*)infoarray
{
    //使用模型数组存储数据
    if (_infoarray==nil)
        
    {
        // 1.加载plist
        NSBundle *bundle=[NSBundle mainBundle];
        NSString *path=[bundle pathForResource:@"loadinglist" ofType:@"plist"];
        NSArray *temparray=[NSArray arrayWithContentsOfFile:path];
        // 2.创建模型数组
        NSMutableArray *array=[NSMutableArray array];
        for (NSString *ss in temparray)
        {
            
            //ZKZApp *app=[[ZKZApp alloc]initWithDic:dic];
            ZKZDownloadData *app=[[ZKZDownloadData alloc]init];
            app.urlString = ss;
            [array addObject:app];
            
        }
        // 3.赋值
        _infoarray=array;
        
        
        
    }
    return _infoarray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView registerClass:[ZKZTableViewCell2 class] forCellReuseIdentifier:@"cellId"];
    self.tableView = tableView;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.infoarray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZKZTableViewCell2 * cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ZKZTableViewCell2 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
        NSLog(@"***********");
    }
    ZKZDownloadData * data  = [self.infoarray objectAtIndex:indexPath.row];
    cell.downLoadData = data;
    cell.CellDelegate = self;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150.0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];// 取消选中
}
#pragma mark------ZKZTableViewCell 代理方法
-(void)cellButtonClickTapWith:(ZKZTableViewCell2 *)cell
{
    NSIndexPath *indexPath=[self.tableView indexPathForCell:cell];
    NSLog(@"----------%ld",(long)indexPath.row);
   ZKZDownloadData * loadData = [self.infoarray objectAtIndex:indexPath.row];
    [loadData setIsloading:YES];
    ZKZDownLoadManager * manager = [[ZKZDownLoadManager alloc]init];
    manager.MaxDownLoadCount = 2;
    ZKZDownLoadOperation * operation = [[ZKZDownLoadOperation alloc]initWithDownLoadUrlString:loadData.urlString];
    operation.delegate = cell;
    [manager addSubQueue:operation];
}

@end
