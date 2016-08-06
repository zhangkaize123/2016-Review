//
//  ViewController.m
//  tableView重复利用cell另一种方法
//
//  Created by 张凯泽 on 16/5/26.
//  Copyright © 2016年 rytong_zkz. All rights reserved.
//

#import "ViewController.h"
#import "ZKZCarinfo.h"
#import "ZKZObjTableViewCell.h"
static NSString* ss = @"xxx";
//const右边的总不能被修改
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.dataSource=self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    [tableView registerClass:[ZKZObjTableViewCell class] forCellReuseIdentifier:ss];
    
}
/**读取数据模型里边的数据*/
-(NSArray *)array
{
    NSMutableArray *temparray=[NSMutableArray array];
    if (_array==nil) {
        
        ZKZCarinfo *carinfo1=[[ZKZCarinfo alloc]init];
        carinfo1.titleStr=@"德系品牌";
        carinfo1.carsarray=[NSArray arrayWithObjects:@"宝马",@"奔驰",@"大众", nil] ;
        carinfo1.discStr=@"高端大气上档次";
        [temparray addObject:carinfo1];
        ZKZCarinfo *carinfo2=[[ZKZCarinfo alloc]init];
        carinfo2.titleStr=@"日韩品牌";
        carinfo2.carsarray=[NSArray arrayWithObjects:@"丰田",@"本田",@"铃木",@"丰田",@"本田",@"丰田",@"本田",@"丰田",@"本田",@"丰田",@"本田",@"丰田",@"本田",@"丰田",@"本田", nil] ;
        carinfo2.discStr=@"低调奢华有内涵";
        [temparray addObject:carinfo2];
        self.array=[NSArray arrayWithObjects:carinfo1,carinfo2, nil];
    }
    return _array;
}

/**
 *  第section组有多少行
 */

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}
/**
 *  每一行显示怎样的内容(cell)
 */
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZKZObjTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ss forIndexPath:indexPath];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"xxx"];
//        NSLog(@"%d",indexPath.row);
//    }
    
    
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    return cell;
    
    
}


@end
