//
//  BasePickerView.h
//  ZWNetUtils
//
//  Created by wanney on 15/8/14.
//  Copyright (c) 2015年 testWanney. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BasePickerView;
@protocol BasePickerDelegate <NSObject>

@optional
-(void)didSelectChangeStatus:(BasePickerView *)picker andTag:(NSInteger) tag;
@end

@interface BasePickerView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
@property (assign, nonatomic) id<BasePickerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIPickerView *basePicker;
@property (copy, nonatomic) NSString * pickerName;
@property (assign, nonatomic) NSInteger  pickerNumber;
@property (assign,nonatomic) NSInteger tag;

- (id)initWithDelegate:(id <BasePickerDelegate>)delegate andArray:(NSArray *)array andTag :(NSInteger)tag;

@end
