//
//  MultiChooseTableViewController.m
//  ZheShiDa
//
//  Created by 晏语科技 on 16/4/1.
//  Copyright © 2016年 yykj. All rights reserved.
//

#import "MultiChooseTableViewController.h"
@interface MultiChooseTableViewController ()
@property (strong, nonatomic) IndustryInfoModel * indusModel;
@property (strong, nonatomic) NSMutableArray * myArray;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backBtnItem;
@end

@implementation MultiChooseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Functions changeTheNaviBarColor:self];
    [self initView];
    self.title = [NSString stringWithFormat:@"%@",self.myTitle];
    self.tableView.backgroundColor = GraybgColor;
    self.tableView.separatorColor = GrayLineColor;
}


- (void) initView{
    [Functions clearExtraLine:self.tableView];
    self.indusModel = [[IndustryInfoModel alloc] init];
    [self fullTableCell];
    [self loadData];
}

//uitableview cell 分割线满格显示
- (void) fullTableCell{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void) loadData{
    [NetConfig requestWith:APIADD(@"index.php/App/Area/getarealist")
             andParameters:@{@"uid":[Functions getUserId],
                             @"token":[Functions getToken],
                             @"parentid":self.parentId}
            handlerDictory:^(id dataDic) {
                if (![dataDic[@"data"] isKindOfClass:[NSString class]]) {
                    [self.indusModel initDataWithArray:dataDic[@"data"]];//初始化数据
                    self.myArray = [[NSMutableArray alloc] initWithArray:self.indusModel.stringArray];
                    [self.tableView reloadData];
                }
            }andWithoutLogin:^{
                //清空UID
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:UserId];
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:Token];
                //执行跳转方法
                [self toLoginVc];
            } andHideSuccessMessage:NO];
}

- (void)viewDidAppear:(BOOL)animated{
    [Functions setTextFontWithBarBtnItem:self.backBtnItem];
    self.backBtnItem.title = @"\U0000E906";
    [Functions resignAllText:self.view];
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
    if(self.type != nil){
        return self.myArray.count + 1;
    }
    return self.myArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * indentifierOne = @"myFunctionTableViewCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifierOne];
    if (cell) {
        UILabel *labelOne = (UILabel *)[cell viewWithTag:1124];
        if (self.type != nil) {
            if (indexPath.row == 0) {
                labelOne.text = @"不限";
                cell.accessoryType = UITableViewCellAccessoryNone;
            }else {
                IndustryInfoModel * md = self.indusModel.industryArray[indexPath.row - 1];
                if(md.haveChild){
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                }else{
                    cell.accessoryType = UITableViewCellAccessoryNone;
                }
                labelOne.text = md.industryName;
            }
        }else{
            IndustryInfoModel * md = self.indusModel.industryArray[indexPath.row];
            if(md.haveChild){
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }else{
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            labelOne.text = md.industryName;
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(self.type != nil){
        if (indexPath.row == 0) {
            NSDictionary * dict = @{@"industryId" : @"000",
                                    @"name"       : @"不限",
                                    @"title"   : self.myTitle};
            [[NSNotificationCenter defaultCenter] postNotificationName:DidChangeTheIndustrySuccessMessage object:dict];
            NSArray *array = self.navigationController.viewControllers;
            if(array.count == 1){
                [self dismissViewControllerAnimated:YES completion:nil];
            }else{
                [self.navigationController popViewControllerAnimated:YES];
            }
        }else{
            IndustryInfoModel * md = self.indusModel.industryArray[indexPath.row - 1];
            if (md.haveChild) {
                MultiChooseTableViewController * multiChooseVc = [self.storyboard instantiateViewControllerWithIdentifier:@"multiChooseVc"];
                multiChooseVc.parentId = md.industryId;
                multiChooseVc.myTitle  = md.industryName;
                [self.navigationController pushViewController:multiChooseVc animated:YES];
            }else{
                NSDictionary * dict = @{@"industryId" : md.industryId,
                                        @"name"       : md.industryName,
                                        @"title"   : md.industryName};
                [[NSNotificationCenter defaultCenter] postNotificationName:DidChangeTheIndustrySuccessMessage object:dict];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }
    } else {
        IndustryInfoModel * md = self.indusModel.industryArray[indexPath.row];
        if (md.haveChild) {
            MultiChooseTableViewController * multiChooseVc = [self.storyboard instantiateViewControllerWithIdentifier:@"multiChooseVc"];
            multiChooseVc.parentId = md.industryId;
            multiChooseVc.myTitle  = md.industryName;
            multiChooseVc.place = self.place;
            multiChooseVc.identify = self.identify;
            [self.navigationController pushViewController:multiChooseVc animated:YES];
        }else{
            if ([Functions isEmptyWithString:self.identify]) {
                self.identify = @"";
            }
            NSDictionary * dict = @{@"industryId" : md.industryId,
                                    @"name"       : md.industryName,
                                    @"title"      : md.industryName,
                                    @"identify"   : self.identify};
            if (self.place.length > 0) {
                [[NSNotificationCenter defaultCenter] postNotificationName:DidChangeTheIndustrySuccessMessage object:dict];
            }else{
                [[NSNotificationCenter defaultCenter] postNotificationName:DidEditResumeMessage object:dict];
            }
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

- (IBAction)backAction:(UIBarButtonItem *)sender {
    NSArray *array = self.navigationController.viewControllers;
    if(array.count == 1){
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - 前往登陆
- (void) toLoginVc{
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    UINavigationController * loginNavi = [storyBoard instantiateViewControllerWithIdentifier:@"loginNavi"];
    [self presentViewController:loginNavi animated:YES completion:nil];
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
