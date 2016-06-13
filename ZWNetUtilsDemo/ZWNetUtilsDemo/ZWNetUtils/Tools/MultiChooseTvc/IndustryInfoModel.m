//
//  IndustryInfoModel.m
//  ZheShiDa
//
//  Created by 晏语科技 on 16/3/18.
//  Copyright © 2016年 yykj. All rights reserved.
//

#import "IndustryInfoModel.h"
@implementation IndustryInfoModel
- (void)initDataWithArray:(NSArray *)array{
    if (![Functions isEmptyWithString:[Functions toString:array]]) {
        NSMutableArray *Arr = [[NSMutableArray alloc]init];
        self.stringArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in array) {
            IndustryInfoModel *md = [[IndustryInfoModel alloc]init];
            [md makeModelWithDict:dict];
            [Arr addObject:md];
            [self.stringArray addObject: dict[@"area_name"]];
        }
        self.industryArray = Arr;
    }else{
        self.stringArray = [[NSMutableArray alloc] init];
        self.industryArray = [[NSArray alloc] init];
    }
}

- (IndustryInfoModel *)makeModelWithDict:(NSDictionary *)userDict{
    if(![Functions isEmptyWithString:[Functions toString:userDict]]){
        self.industryId       = [Functions getString:userDict[@"area_id"] withDefault:@""];//userDict[@"area_id"];
        self.industryName     = [Functions getString:userDict[@"area_name"] withDefault:@""];
        self.industryStyle    = @"";
        self.industryParentId = [Functions getString:userDict[@"parent_id"] withDefault:@""];
        self.industryChild    = [Functions getString:userDict[@"level_end"] withDefault:@""];
        self.industryChildId  = [Functions getString:userDict[@"level"] withDefault:@""];
        self.industryKeyId    = @"";
        self.industrySort     = [Functions getString:userDict[@"sort_order"] withDefault:@""];
        self.industryDesc     = @"";
//        self.haveChild        = ([self.industryChildId componentsSeparatedByString:@","].count > 1);
        self.haveChild        = [[Functions getString:userDict[@"level_end"] withDefault:@""] integerValue] == 1?NO:YES;
    }else{
        self.industryId       = @"";
        self.industryName     = @"";
        self.industryStyle    = @"";
        self.industryParentId = @"";
        self.industryChild    = @"";
        self.industryChildId  = @"";
        self.industryKeyId    = @"";
        self.industrySort     = @"";
        self.industryDesc     = @"";
        self.haveChild        = NO;
    }
    return self;
}

- (void)initData{
    NSMutableArray *Arr = [[NSMutableArray alloc]init];
    self.stringArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i ++) {
        IndustryInfoModel *md = [[IndustryInfoModel alloc]init];
        [md makeModel];
        [self.stringArray addObject:@"重庆"];
        [Arr addObject:md];
    }
    self.industryArray = Arr;
}

- (IndustryInfoModel *)makeModel{
    self.industryId       = @"1";
    self.industryName     = @"重庆";
    self.industryStyle    = @"";
    self.industryParentId = @"";
    self.industryChild    = @"";
    self.industryChildId  = @"";
    self.industryKeyId    = @"";
    self.industrySort     = @"";
    self.industryDesc     = @"";
    self.haveChild        = YES;
    return self;
}

- (void)comparedTheChooseItemWith:(NSArray*)arrayId{
    if (self.industryArray.count > 0) {
        for (int i = 0;i < arrayId.count;i ++) {
            NSString * strId = arrayId[i];
            for (int j = 0; j < self.industryArray.count;j++) {
                IndustryInfoModel * md = self.industryArray[j];
                if ([md.industryId isEqualToString:strId]) {
                    md.isChoosed = YES;
                }else{
                    md.isChoosed = NO;
                }
            }
        }
    }
}
@end
