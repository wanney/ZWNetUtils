//
//  MyTableViewController.m
//  ZWNetUtilsDemo
//
//  Created by 晏语科技 on 16/8/31.
//  Copyright © 2016年 testWanney. All rights reserved.
//

#import "MyTableViewController.h"
#import "ZWNetUtils.h"
@interface MyTableViewController ()
@property (strong, nonatomic) NSArray * dataSource;
@property (strong, nonatomic) NSArray * titleArray;
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void) initView{
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0f;
    _dataSource = @[@[@"ZWSegmentControl - 类网易无限多tab可滑动分段控制器",
                      @"ZWPlaceholderTextView - 有placeholder的textview",
                      @"ZWRadarChart - 雷达图",
                      @"ZWTagsView - 个性化标签",
                      @"ZWPageView - 广告轮播图控件",
                      @"ZWIntroView - 欢迎界面",
                      @"ZWProgressView - 进度条",
                      @"ZWRadioButton - 单选按钮"],
                    @[@"ZWSegmentedView - 顶部tab   - view !",
                      @"ZWAlertView - 底部弹出的列表菜单",
                      @"ZWPickerView - 代替输入框显示的选择器"],
                    @[@"MBProgressHUD+ZW - 基于MBProgressHUD个性化显示的封装",
                      @"ZWNetworking - 基于AFNetworking的封装",
                      @"ZWExtension - 用于自动生成模型",
                      @"ZWTabBarItem - 保持tabbar文字颜色和图片颜色保持一致"],
                    @[@"ZWPhotoActionSheet - 选择照片",
                      @"ZWPhotoBrowser - 快速浏览图片控件",
                      @"ZWImageCropperViewController - 可裁剪图片的图片选择器"]];
    _titleArray = @[@"自定义视图",
                    @"辅助视图",
                    @"基于其他lib的扩展",
                    @"跟系统图片有关的控件"];
    [Functions clearExtraLine:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)_dataSource[section]).count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyLabelCell" forIndexPath:indexPath];
    // Configure the cell...
    if (cell) {
        UILabel * myLabel = [cell viewWithTag:2046];
        myLabel.text = _dataSource[indexPath.section][indexPath.row];
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        [self performSegueWithIdentifier:@"toCustomView" sender:nil];
    }else if (indexPath.section == 1){
        [self performSegueWithIdentifier:@"toAssistView" sender:nil];
    }else if (indexPath.section == 2){
        [self performSegueWithIdentifier:@"toLibCategory" sender:nil];
    }else if (indexPath.section == 3){
        [self performSegueWithIdentifier:@"toPhotoPicker" sender:nil];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //viewforHeader
    id label = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    if (!label) {
        label = [[UILabel alloc] init];
        [label setFont:[UIFont systemFontOfSize:14.5f]];
        [label setTextColor:BlackDarkColor];
        [label setBackgroundColor:GraybgColor];
    }
    [label setText:[NSString stringWithFormat:@"    %@",_titleArray[section]]];
    return label;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 32.0f;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
