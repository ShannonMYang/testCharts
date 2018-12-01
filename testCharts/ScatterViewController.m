//
//  ScatterViewController.m
//  testCharts
//
//  Created by Shannon MYang on 2018/5/2.
//  Copyright © 2018年 Shannon MYang. All rights reserved.
//

#import "ScatterViewController.h"
#import "testCharts-Bridging-Header.h"

@interface ScatterViewController () <ChartViewDelegate>

@property (nonatomic, strong) ScatterChartView *chartView;

@property (nonatomic, strong) NSArray *xAxisArray;
@property (nonatomic, strong) NSArray *yAxisArray;

@end

@implementation ScatterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initCreateUIControl];
    [self initScatterData];
}

// 初始化UI
- (void)initCreateUIControl
{
    // 创建 散点图 图表视图
    [self createNewScatterChartView];
    // 设置 散点图 图表视图 的 说明
    [self installNewScatterChartViewProperty];
    [self installTheXAxisAndGridLineProperty];
    [self installTheYAxisAndGridLineProperty];
}

#pragma mark - 加入散点图视图
- (void)createNewScatterChartView
{
    self.chartView = [[ScatterChartView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.width)];
    
    self.chartView.backgroundColor = [UIColor whiteColor];
    
    self.chartView.noDataText = @"暂无数据";
    
    self.chartView.delegate = self;
    
    self.chartView.chartDescription.enabled = NO;
    
    self.chartView.drawGridBackgroundEnabled = NO;
    
    self.chartView.dragEnabled = YES;
    [self.chartView setScaleEnabled:YES];
    
    self.chartView.pinchZoomEnabled = YES;
    [self.view addSubview:self.chartView];
}

#pragma mark - 设置 x轴、y轴、网格线 属性
- (void)installNewScatterChartViewProperty
{
    ChartLegend *l = self.chartView.legend;
    l.horizontalAlignment = ChartLegendHorizontalAlignmentRight;
    l.verticalAlignment = ChartLegendVerticalAlignmentTop;
    l.orientation = ChartLegendOrientationHorizontal;  // 将注释至于下方
    l.wordWrapEnabled = YES;
    l.drawInside = NO;
    l.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:8.f];
    l.xOffset = 5.0;
}

- (void)installTheXAxisAndGridLineProperty
{
    ChartXAxis *xl = self.chartView.xAxis;
    xl.labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:8.f];
    xl.drawGridLinesEnabled = YES;
    xl.axisMinimum = 0.0;
    
    // X轴对应的网格线
    xl.gridLineDashLengths = @[@5.0f, @5.0f];
    xl.gridColor = [UIColor redColor];
    xl.gridAntialiasEnabled = YES;
}

- (void)installTheYAxisAndGridLineProperty
{
    ChartYAxis *yl = self.chartView.leftAxis;
    yl.labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:8.f];
    yl.drawGridLinesEnabled = YES;  // 允许绘制网格线
    yl.axisMinimum = 0.0;  // Y轴起始的最小值
    
    self.chartView.rightAxis.enabled = NO;  // 不绘制右边轴
    
    // Y轴对应的网格线
    yl.gridLineDashLengths = @[@5.0f, @5.0f];  // 网格线线宽
    yl.gridColor = [UIColor orangeColor];  //网格线颜色
    yl.gridAntialiasEnabled = YES;  // 开启锯齿抗拒
}

// 初始化数据
- (void)initScatterData
{
    NSMutableArray *dataEntry = [[NSMutableArray alloc] init];
    
    self.xAxisArray = @[@"123.456", @"156.623", @"235.211", @"301.110", @"192.232", @"750.611", @"231.232"];
    self.yAxisArray = @[@"555.220", @"752.112", @"612.221", @"123.123", @"456.114", @"112.444", @"755.114"];
    
    for (int i = 0; i < self.xAxisArray.count; i++) {
        [dataEntry addObject:[[ChartDataEntry alloc] initWithX:[self.xAxisArray[i] doubleValue]
                                                             y:[self.yAxisArray[i] doubleValue]]];
    }
    
    ScatterChartDataSet *set = [[ScatterChartDataSet alloc] initWithValues:dataEntry label:@"散点图"];
    [set setScatterShape:ScatterShapeCircle];
    [set setColor:ChartColorTemplates.colorful[0]];
    set.scatterShapeSize = 6.0;
    set.valueFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:8.f];
    [set setDrawValuesEnabled:YES]; //散点图是否显示数值
    
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    [dataSets addObject:set];
    
    ScatterChartData *data = [[ScatterChartData alloc] initWithDataSet:set];
    self.chartView.data = data;
}

#pragma mark - ChartViewDelegate
- (void)chartValueSelected:(ChartViewBase *)chartView entry:(ChartDataEntry *)entry highlight:(ChartHighlight *)highlight {
    NSLog(@"+_+_+_+_+_+_+_+_%f   _+_+_+_+_+_+_+_+_+%f", entry.x, entry.y);
    NSLog(@"chartValueSelected");
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView {
    NSLog(@"chartValueNothingSelected");
}

@end
