//
//  ViewController.m
//  多任务下载
//
//  Created by 张凯泽 on 16/4/27.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "ZKZTableViewCell.h"
#import "ZKZDownloadData.h"
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
    ZKZTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[ZKZTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.CellDelegate = self;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150.0;
}
#pragma mark------ZKZTableViewCell 代理方法
-(void)cellButtonClickTapWith:(ZKZTableViewCell *)cell
{
    NSIndexPath *indexPath=[self.tableView indexPathForCell:cell];
    ZKZDownloadTask *task = [[ZKZDownloadTask alloc]init];
    task.delegate = cell;
    ZKZDownloadData * downloadData = [self.infoarray objectAtIndex:indexPath.row];
    [task downloadImagedata:downloadData.urlString];
    
    
   
}

@end
