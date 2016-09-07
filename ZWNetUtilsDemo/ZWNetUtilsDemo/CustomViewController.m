//
//  CustomViewController.m
//  ZWNetUtilsDemo
//
//  Created by 晏语科技 on 16/8/31.
//  Copyright © 2016年 testWanney. All rights reserved.
//

#import "CustomViewController.h"
#import "CustomChildViewController.h"
#import "CustomChildTwoViewController.h"
#import "CustomChildThreeTableViewController.h"
#import "ZWNetUtils.h"
@interface CustomViewController ()<XYYSegmentControlDelegate>
- (IBAction)backAction:(UIBarButtonItem *)sender;
@property (nonatomic, strong) XYYSegmentControl *slideSwitchView;
@property (nonatomic, strong) NSArray * titleArray;
@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Functions mallNaviBarStyle:self];
    [self initData];
    [self initSegmentController];
}

- (void) initData{
    _titleArray = @[@"自定义控件一",
                    @"自定义控件二",
                    @"系统控件"];
}

- (void) initSegmentController{
    self.slideSwitchView = [[XYYSegmentControl alloc]initWithFrame:CGRectMake(0 , 64 , ZWidth, ZHeight-64) channelName:_titleArray source:self];
    [self.slideSwitchView setUserInteractionEnabled:YES];
    //XYYSegmentControl代理
    self.slideSwitchView.segmentControlDelegate = self;
    //    /被注释的代码可以调整整个segment 样式颜色值。
    //设置tab 颜色(可选)
    self.slideSwitchView.tabItemNormalColor = Gray8DColor;
    //设置tab 被选中的颜色(可选)
    self.slideSwitchView.tabItemSelectedColor = BlackDarkColor;
    self.slideSwitchView.tabItemNormalFont = 14;
    self.slideSwitchView.tabItemSelectedFont = 14;
    //设置tab 背景颜色(可选)
    self.slideSwitchView.tabItemNormalBackgroundColor = [UIColor whiteColor];
    self.slideSwitchView.tabItemSelectionIndicatorColor = BlackDarkColor;
    self.slideSwitchView.tabSelectionStyle = XYYSegmentedControlSelectionStyleFullWidthStripe;
    [self.view addSubview:self.slideSwitchView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - XYYSegmentControlDelegate
- (NSUInteger)numberOfTab:(XYYSegmentControl *)view{
    return _titleArray.count;
}

- (UIViewController *)slideSwitchView:(XYYSegmentControl *)view viewOfTab:(NSUInteger)number{
    if (number == 0) {
        CustomChildViewController * customVc = [self.storyboard instantiateViewControllerWithIdentifier:@"CustomChildViewController"];
        return customVc;
    }else if (number == 1){
        CustomChildTwoViewController * customTwoVc = [self.storyboard instantiateViewControllerWithIdentifier:@"CustomChildTwoViewController"];
        return customTwoVc;
    }else{
        CustomChildThreeTableViewController * customThreeVc = [self.storyboard instantiateViewControllerWithIdentifier:@"CustomChildThreeTableViewController"];
        return customThreeVc;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backAction:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
