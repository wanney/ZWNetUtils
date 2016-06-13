//
//  IndustryInfoModel.h
//  ZheShiDa
//
//  Created by 晏语科技 on 16/3/18.
//  Copyright © 2016年 yykj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IndustryInfoModel : NSObject
@property (strong, nonatomic) NSString * industryId;
@property (strong, nonatomic) NSString * industryName;
@property (strong, nonatomic) NSString * industryStyle;
@property (strong, nonatomic) NSString * industryParentId;
@property (strong, nonatomic) NSString * industryChild;
@property (strong, nonatomic) NSString * industryChildId;
@property (strong, nonatomic) NSString * industryKeyId;
@property (strong, nonatomic) NSString * industrySort;
@property (strong, nonatomic) NSString * industryDesc;
@property (strong, nonatomic) NSArray  * industryArray;
@property (strong, nonatomic) NSMutableArray * stringArray;
@property (assign, nonatomic) BOOL haveChild;
//@property (strong, nonatomic) NSMutableArray * arrayId;
@property (assign, nonatomic) BOOL  isChoosed;
- (void)initDataWithArray:(NSArray *)array;
- (void)comparedTheChooseItemWith:(NSArray*)arrayId;
- (void)initData;
@end
