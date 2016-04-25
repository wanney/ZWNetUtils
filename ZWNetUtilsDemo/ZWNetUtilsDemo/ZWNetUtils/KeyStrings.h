//
//  KeyStrings.h
//  ZWNetUtils
//
//  Created by Wanney on 15/8/29.
//  Copyright (c) 2015年 testWanney. All rights reserved.
//

#ifndef TemplateDemo_KeyStrings_h
#define TemplateDemo_KeyStrings_h

//提示框显示类
#define LoadingNote              @"努力加载中"
#define LoginNote                @"请先登录..."
#define LogOutNote               @"注销成功"
#define LogOutErrorNote          @"未登录"
#define NameInputErrorNote       @"用户名不能为空"
#define NameLengthErrorNote      @"用户名不能少位4位"
#define EmailInputErrorNote      @"邮箱不能为空"
#define EmailFormatErrorNot      @"邮箱格式不正确"
#define CodeInputErrorNote       @"密码不能为空"
#define CodeLengthErrorNote      @"密码长度不能少于六位"
#define RepeatCodeInputErrorNote @"请再输入一次密码"
#define AutoGoToBackNote         @"正在跳转..."
#define RegisterSuccessBack      @"注册成功，正在登录..."
#define TheApiWillOpenNote       @"功能即将开放，敬请期待..."


//其他类
#define UserId       @"userid"
#define UserName     @"username"
#define AdminId      @"adminid"
#define Token        @"token"
#define Latitude     @"latitude"
#define Longitude    @"longitude"



#define LightGreenColor [UIColor colorWithRed:161/255.0 green:202/255.0 blue:207/255.0 alpha:1]
#define LightGrayColor  [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1]
#define ZWidth          [UIScreen mainScreen].bounds.size.width
#define ZHeight         [UIScreen mainScreen].bounds.size.height

#define ORIGINAL_MAX_WIDTH 640.0f

#define CaptchaCodeTime 60
#define DelayReloadTime 1.0

#define XCODE_COLORS_ESCAPE @"\033["

#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color

#define LogBlue(frmt, ...)    NSLog((XCODE_COLORS_ESCAPE @"fg0,0,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogRed(frmt, ...)     NSLog((XCODE_COLORS_ESCAPE @"fg255,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogGreen(frmt, ...)   NSLog((XCODE_COLORS_ESCAPE @"fg0,255,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogOrange(frmt, ...)  NSLog((XCODE_COLORS_ESCAPE @"fg255,127,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogCyan(frmt, ...)    NSLog((XCODE_COLORS_ESCAPE @"fg0,255,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogMagenta(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,0,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogYellow(frmt, ...)  NSLog((XCODE_COLORS_ESCAPE @"fg255,255,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)

#endif
