//
//  ViewController.m
//  testCharts
//
//  Created by Shannon MYang on 2018/4/19.
//  Copyright © 2018年 Shannon MYang. All rights reserved.
//

#import "ViewController.h"
#import "testCharts-Bridging-Header.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *baseTableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Charts";
    self.view.backgroundColor = [UIColor whiteColor];
    [self prepareTableView];
    [self prepareData];
}

- (void)prepareTableView
{
    //实例化TableView位置、样式
    self.baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    //注册Cell
    [self.baseTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
    //解决头尾视图设置高度无效问题
    self.baseTableView.estimatedSectionHeaderHeight = 0;
    self.baseTableView.estimatedSectionFooterHeight = 0;
    //设置代理
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
    //添加到视图
    [self.view addSubview:self.baseTableView];
    //取消尾视图分割线
    self.baseTableView.tableFooterView = [[UIView alloc] init];
}

- (void)prepareData
{
    self.dataArray = @[@"LineViewController", @"ScatterViewController", @"", @"", @"", @"", @"", @"", @"", @""];
    [self.baseTableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:16.f];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;  // cell 最右侧图标样式
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //跳转
    [self pushViewControllerWithName:self.dataArray[indexPath.row]];
}

#pragma mark - 视图跳转
- (void)pushViewControllerWithName:(NSString *)viewControllerName
{
    Class className = NSClassFromString(viewControllerName);
    if (className) {
        UIViewController *viewController = [[className alloc] init];
        [viewController setHidesBottomBarWhenPushed:NO];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
