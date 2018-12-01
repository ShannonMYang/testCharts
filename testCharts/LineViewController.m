//
//  LineViewController.m
//  testCharts
//
//  Created by Shannon MYang on 2018/4/23.
//  Copyright © 2018年 Shannon MYang. All rights reserved.
//

#import "LineViewController.h"
#import "testCharts-Bridging-Header.h"

@interface LineViewController () <ChartViewDelegate>

@property (nonatomic, strong) LineChartView *chartView;

@end

@implementation LineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LineChart";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initLineChartView];
}

- (void)initLineChartView
{
    self.chartView.noDataText = @"暂无数据";
    self.chartView.noDataFont = [UIFont fontWithName:@"PingFang-SC-Regular" size:18.f];
    
    self.chartView.delegate = self;
    self.chartView.chartDescription.enabled = NO;
    self.chartView.dragEnabled = YES;
    [self.chartView setScaleEnabled:YES];
    self.chartView.pinchZoomEnabled = YES;
    self.chartView.drawGridBackgroundEnabled = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
