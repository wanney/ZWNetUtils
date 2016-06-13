//
//  MultiChooseTableViewController.h
//  ZheShiDa
//
//  Created by 晏语科技 on 16/4/1.
//  Copyright © 2016年 yykj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiChooseTableViewController : UITableViewController
@property (strong, nonatomic) NSString * parentId;
@property (strong, nonatomic) NSString * myTitle;
@property (strong, nonatomic) NSString * type;//当作为条件选择器使用时，需要补充一个“不限”的字样，以消除当前的选择项
@property (strong, nonatomic) NSString * place;//为空的时候是会员所在地，不为空的时候是简历的地区
@property (nonatomic, strong) NSString * identify; //来源的标志
@end
