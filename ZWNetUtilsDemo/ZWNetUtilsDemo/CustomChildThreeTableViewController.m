//
//  CustomChildThreeTableViewController.m
//  ZWNetUtilsDemo
//
//  Created by 晏语科技 on 16/8/31.
//  Copyright © 2016年 testWanney. All rights reserved.
//

#import "CustomChildThreeTableViewController.h"
#import "ZWNetUtils.h"
@interface CustomChildThreeTableViewController ()
- (IBAction)changeSegAction:(UISegmentedControl *)sender;
- (IBAction)changeValueAction:(UISlider *)sender;
- (IBAction)changeStepAction:(UIStepper *)sender;
- (IBAction)timePickerAction:(UIButton *)sender;
- (IBAction)switchAction:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;    // 赋值：50
@property (weak, nonatomic) IBOutlet UILabel *progressLabel; // 15/20
@property (weak, nonatomic) IBOutlet UITextField *timeTextField;     // 时间：
@property (strong, nonatomic) UIDatePicker * datePicker;
@property (assign, nonatomic) BOOL isEdit;
@end

@implementation CustomChildThreeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Functions clearExtraLine:self.tableView];
    [self initDatePicker];
}

- (void) initDatePicker{
    _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0.0,0.0,0.0,0.0)];
    [_datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans_CN"]];
    _datePicker.datePickerMode = UIDatePickerModeDateAndTime;   //共有四种状态，时间，日期，时间和日期，24小时制
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didTimeTextBegin) name:UITextFieldTextDidBeginEditingNotification object:self.timeTextField];
    [_datePicker addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventValueChanged];
    self.timeTextField.inputView = _datePicker;
}

- (void) textChanged:(UIDatePicker *)sender{
    UIDatePicker * control = (UIDatePicker *)sender;
    NSDate* date = control.date;
    NSDateFormatter *format = [[NSDateFormatter  alloc] init];
    [format setDateFormat:@"yyyy年MM月dd日"];
    NSDateFormatter *strFormat = [[NSDateFormatter alloc] init];
    [strFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    if((long)[date timeIntervalSince1970] < (long)[[NSDate date] timeIntervalSince1970]){
        self.timeTextField.text = [NSString stringWithFormat:@"时间：%@",[strFormat stringFromDate:date]];
    }else{
        [_datePicker setDate:[NSDate date] animated:YES];
        self.timeTextField.text = [NSString stringWithFormat:@"时间：%@",[strFormat stringFromDate:date]];
    }
}

- (void)didTimeTextBegin{
    //当开始选择时就默认选择第一个作为默认选项
    if(!self.isEdit){
        self.isEdit = YES;
        NSDate* date = [NSDate date];
        NSDateFormatter *format = [[NSDateFormatter  alloc] init];
        [format setDateFormat:@"yyyy年MM月dd日"];
        NSDateFormatter *strFormat = [[NSDateFormatter alloc] init];
        [strFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        self.timeTextField.text = [NSString stringWithFormat:@"时间：%@",[strFormat stringFromDate:date]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)changeSegAction:(UISegmentedControl *)sender {
    if (self.timeTextField.isFirstResponder) {
        [self.timeTextField resignFirstResponder];
    }
}

- (IBAction)changeValueAction:(UISlider *)sender {
    if (self.timeTextField.isFirstResponder) {
        [self.timeTextField resignFirstResponder];
    }
    self.valueLabel.text = [NSString stringWithFormat:@"赋值：%f",sender.value];
}

- (IBAction)changeStepAction:(UIStepper *)sender {
    if (self.timeTextField.isFirstResponder) {
        [self.timeTextField resignFirstResponder];
    }
}

- (IBAction)timePickerAction:(UIButton *)sender {
    if (self.timeTextField.isFirstResponder) {
        [self.timeTextField resignFirstResponder];
    }else{
        [self.timeTextField becomeFirstResponder];
    }
}

- (IBAction)switchAction:(UISwitch *)sender {
    if (self.timeTextField.isFirstResponder) {
        [self.timeTextField resignFirstResponder];
    }
}
@end
