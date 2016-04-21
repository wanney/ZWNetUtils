//
//  BasePickerView.m
//  MilesTouch
//
//  Created by 晏语科技 on 15/8/14.
//  Copyright (c) 2015年 ybywl. All rights reserved.
//

#import "BasePickerView.h"
@interface BasePickerView ()
{
    NSArray *options;
}
@end

@implementation BasePickerView

@synthesize delegate;
@synthesize basePicker;
@synthesize tag;

- (id)initWithDelegate:(id<BasePickerDelegate>)delegate andArray:(NSArray *)array andTag:(NSInteger) tag
{
    
    self = [[[NSBundle mainBundle] loadNibNamed:@"BasePickerView" owner:self options:nil] objectAtIndex:0];
    self.tag = tag;
    if (self) {
        self.delegate = delegate;
        self.basePicker.dataSource = self;
        self.basePicker.delegate = self;
        options = array;
        self.pickerName = [options objectAtIndex:0];
    }
    return self;
    
}

#pragma mark - PickerView lifecycle

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [options count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [options objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"inside pickerview didselect   row = %ld,component = %ld .",row,component);
    //返回序号和名字
    self.pickerName = [options objectAtIndex:row];
    self.pickerNumber = row;
    if([self.delegate respondsToSelector:@selector(didSelectChangeStatus:andTag:)]) {
        [self.delegate didSelectChangeStatus:self andTag:self.tag];
    }
}


@end

