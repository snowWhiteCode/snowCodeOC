//
//  ViewController.m
//  snowCodeOC
//
//  Created by baixue on 2018/3/17.
//  Copyright © 2018年 baixue. All rights reserved.
//

#import "ViewController.h"
#import "BXDecorateExpressionsViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   /*修饰词的使用与作用*/
    [self.view addSubview:self.tableview];

}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.tableview.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
}

#pragma mark -- UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BXDecorateExpressionsViewController *vc = [[BXDecorateExpressionsViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark -- getter/setter
-(NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = @[@"修饰词的使用与作用",@"",@"",@"",@""].mutableCopy;
    }
    return _dataSource;
}

-(UITableView *)tableview
{
    if (_tableview == nil) {
        _tableview = [[UITableView alloc]initWithFrame:(CGRectZero) style:(UITableViewStylePlain)];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    }
    return _tableview;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
