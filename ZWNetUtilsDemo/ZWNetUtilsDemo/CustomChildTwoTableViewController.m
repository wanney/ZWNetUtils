//
//  CustomChildTwoTableViewController.m
//  ZWNetUtilsDemo
//
//  Created by 晏语科技 on 16/9/2.
//  Copyright © 2016年 testWanney. All rights reserved.
//

#import "CustomChildTwoTableViewController.h"
#import "ZWNetUtils.h"
@interface CustomChildTwoTableViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *oneCell;
@property (weak, nonatomic) IBOutlet PlaceholderTextView *myTextView;
@property (strong, nonatomic) IBOutletCollection(DLRadioButton) NSArray *btnArray;
@property (weak, nonatomic) IBOutlet UAProgressView *myProgressView;
@property (weak, nonatomic) IBOutlet UIStepper *mtStepper;
- (IBAction)changeStepAction:(UIStepper *)sender;

@end

@implementation CustomChildTwoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeStepAction:(UIStepper *)sender {
    
}
@end
