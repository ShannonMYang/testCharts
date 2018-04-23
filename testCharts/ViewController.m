//
//  ViewController.m
//  testCharts
//
//  Created by Shannon MYang on 2018/4/19.
//  Copyright © 2018年 Shannon MYang. All rights reserved.
//

#import "ViewController.h"
#import "testCharts-Bridging-Header.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //测试代码
    BarChartView *chartView = [[BarChartView alloc] initWithFrame:self.view.bounds];
    chartView.backgroundColor = [UIColor colorWithRed:0.184 green:1.000 blue:0.738 alpha:1.000];
    [self.view addSubview:chartView];
}


@end
