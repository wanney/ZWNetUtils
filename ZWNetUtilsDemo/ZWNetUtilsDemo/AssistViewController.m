//
//  AssistViewController.m
//  ZWNetUtilsDemo
//
//  Created by 晏语科技 on 16/8/31.
//  Copyright © 2016年 testWanney. All rights reserved.
//

#import "AssistViewController.h"
#import "ZWNetUtils.h"
@interface AssistViewController ()
- (IBAction)backAction:(UIBarButtonItem *)sender;

@end

@implementation AssistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Functions mallNaviBarStyle:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
