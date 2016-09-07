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

#define JPushAppKey    @"035ff06197ec95249bf9a562"

//其他类
#define UserId       @"userid"
#define UserName     @"username"
#define AdminId      @"adminid"
#define Token        @"token"
#define Latitude     @"latitude"
#define Longitude    @"longitude"

#define DidChangeTheIndustrySuccessMessage @"didChangeTheIndustrySuccessMessage"

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define LightGreenColor [UIColor colorWithRed:161/255.0 green:202/255.0 blue:207/255.0    alpha:1]
#define LightGrayColor  [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0    alpha:1]

#define GrayADColor [UIColor colorWithRed:173/255.0f green:173/255.0f blue:173/255.0f     alpha:1.0f]
#define Gray4DColor [UIColor colorWithRed:77/255.0f green:77/255.0f blue:77/255.0f        alpha:1.0f]
#define Gray6DColor [UIColor colorWithRed:103/255.0f green:103/255.0f blue:103/255.0f     alpha:1.0f]
#define Gray2DColor [UIColor colorWithRed:45/255.0f green:45/255.0f blue:45/255.0f        alpha:1.0f]
#define Gray8DColor [UIColor colorWithRed:141/255.0f green:141/255.0f blue:141/255.0f     alpha:1.0f]
#define GreenOptionColor [UIColor colorWithRed:51/255.0f green:201/255.0f blue:137/255.0f alpha:1.0f]

#define GrayLineColor [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f    alpha:1.0f]
#define GraybgColor [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f    alpha:1.0f]

//深黑色
#define BlackDarkColor [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f  alpha:1.0f]

#define ZWidth          [UIScreen mainScreen].bounds.size.width
#define ZHeight         [UIScreen mainScreen].bounds.size.height

#define ORIGINAL_MAX_WIDTH 640.0f

#define CaptchaCodeTime 60
#define DelayReloadTime 1.0

#define OnePixelHeight   1.f/[UIScreen mainScreen].scale
#define NavigationBarFontSize 20

#define XCODE_COLORS_ESCAPE @"\033["

#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define LogBlue(frmt, ...)    NSLog((XCODE_COLORS_ESCAPE @"fg0,0,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogRed(frmt, ...)     NSLog((XCODE_COLORS_ESCAPE @"fg255,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogGreen(frmt, ...)   NSLog((XCODE_COLORS_ESCAPE @"fg0,255,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogOrange(frmt, ...)  NSLog((XCODE_COLORS_ESCAPE @"fg255,127,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogCyan(frmt, ...)    NSLog((XCODE_COLORS_ESCAPE @"fg0,255,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogMagenta(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,0,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogYellow(frmt, ...)  NSLog((XCODE_COLORS_ESCAPE @"fg255,255,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)

#endif
