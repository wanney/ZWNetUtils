//
//  NetConfig.h
//  ZWNetUtils
//
//  Created by Wanney on 15/8/29.
//  Copyright (c) 2015年 testWanney. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NetConfig : NSObject
#pragma mark - 下面是Get方法
/*
 *Urlstring : 接口地址
 *parameters: 接口参数
 *isHidden  : 是否隐藏所有提示对话框
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andHideProgressBar:(BOOL)isHidden;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *logoutThings  : 没有登录的回调事件
 *isHidden      : 是否隐藏所有提示对话框
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andWithoutLogin:(void (^)())logoutThings andHideProgressBar:(BOOL)isHidden;
/*
 *Urlstring : 接口地址
 *parameters: 接口参数
 *isHidden  : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andHideSuccessMessage: (BOOL)isHidden;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *logoutThings  : 没有登录的回调事件
 *isHidden      : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andWithoutLogin:(void (^)())logoutThings andHideSuccessMessage: (BOOL)isHidden;
/*
 *Urlstring : 接口地址
 *parameters: 接口参数
 *result    : 请求结果的回调函数
 *isHidden  : 是否隐藏所有提示对话框
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result andHideProgressBar:(BOOL) isHidden;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *result        : 请求结果的回调函数
 *logoutThings  : 没有登录的回调事件
 *isHidden      : 是否隐藏所有提示对话框
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result andWithoutLogin:(void (^)())logoutThings andHideProgressBar:(BOOL) isHidden;
/*
 *Urlstring : 接口地址
 *parameters: 接口参数
 *result    : 请求结果的回调函数
 *isHidden  : 是否隐藏所有提示对话框
 *vc        : 当前的view controller
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result andHideProgressBar:(BOOL) isHidden andVc:(UIViewController *)vc;

/*
 *Urlstring : 接口地址
 *parameters: 接口参数
 *result    : 请求结果的回调函数
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *result        : 请求结果的回调函数
 *logoutThings  : 没有登录的回调事件
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result andWithoutLogin:(void (^)())logoutThings;
/*
 *Urlstring : 接口地址
 *parameters: 接口参数
 *result    : 请求结果的回调函数
 *isHidden  : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result andHideSuccessMessage: (BOOL)isHidden;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *result        : 请求结果的回调函数
 *logoutThings  : 没有登录的回调事件
 *isHidden      : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result andWithoutLogin:(void (^)())logoutThings andHideSuccessMessage: (BOOL)isHidden;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *handleDictory : 处理请求成功后返回数据的回调函数
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)( id dataDic)) handleDictory;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *logoutThings  : 没有登录的回调事件
 *handleDictory : 处理请求成功后返回数据的回调函数
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)( id dataDic)) handleDictory andWithoutLogin:(void (^)())logoutThings;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *isHidden      : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)( id dataDic)) handleDictory andHideSuccessMessage: (BOOL)isHidden;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *logoutThings  : 没有登录的回调事件
 *isHidden      : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)( id dataDic)) handleDictory andWithoutLogin:(void (^)())logoutThings andHideSuccessMessage: (BOOL)isHidden;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *isHidden      : 是否隐藏所有提示对话框
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)( id dataDic)) handleDictory andHideProgressBar:(BOOL) isHidden;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *logoutThings  : 没有登录的回调事件
 *isHidden      : 是否隐藏所有提示对话框
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)( id dataDic)) handleDictory andWithoutLogin:(void (^)())logoutThings andHideProgressBar:(BOOL) isHidden;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *result        : 请求结果的回调函数
 *handleDictory : 处理请求成功后返回数据的回调函数
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result handlerDictory:(void (^)(id dataDic)) handleDictory;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *result        : 请求结果的回调函数
 *logoutThings  : 没有登录的回调事件
 *handleDictory : 处理请求成功后返回数据的回调函数
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result handlerDictory:(void (^)(id dataDic)) handleDictory andWithoutLogin:(void (^)())logoutThings;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *result        : 请求结果的回调函数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *isHidden      : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)(BOOL isSuccess)) result handlerDictory:(void (^)(id dataDic)) handleDictory andHideSuccessMessage:(BOOL) isHidden;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *result        : 请求结果的回调函数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *logoutThings  : 没有登录的回调事件
 *isHidden      : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */

+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)(BOOL isSuccess)) result handlerDictory:(void (^)(id dataDic)) handleDictory andWithoutLogin:(void (^)())logoutThings andHideSuccessMessage:(BOOL) isHidden;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *result        : 请求结果的回调函数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *isHidden      : 是否隐藏所有提示对话框
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)(BOOL isSuccess)) result handlerDictory:(void (^)(id dataDic)) handleDictory andHideProgressBar:(BOOL) isHidden;
/*
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *result        : 请求结果的回调函数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *logoutThings  : 没有登录的回调事件
 *isHidden      : 是否隐藏所有提示对话框
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)(BOOL isSuccess)) result handlerDictory:(void (^)(id dataDic)) handleDictory andWithoutLogin:(void (^)())logoutThings andHideProgressBar:(BOOL) isHidden;
/*
 *Urlstring      : 接口地址
 *parameters     : 接口参数
 *result         : 请求结果的回调函数
 *handleDictory  : 处理请求成功后返回数据的回调函数
 *logoutThings   : 没有登录的回调事件
 *isShowProgress : 是否显示请求进度提示对话框
 *isShowError    : 是否显示错误提示对话框
 *isShowSuccess  : 是否显示成功提示对话框
 */
+ (void)requestWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)(BOOL isSuccess)) result handlerDictory:(void (^)(id dataDic)) handleDictory andWithoutLogin:(void (^)())logoutThings  andShowProgress:(BOOL)isShowProgress andShowError:(BOOL) isShowError andShowSuccess:(BOOL)isShowSuccess;
#pragma mark - 下面是post方法
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring : 接口地址
 *parameters: 接口参数
 *isHidden  : 是否隐藏所有提示对话框
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andHideProgressBar:(BOOL)isHidden;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring   : 接口地址
 *parameters  : 接口参数
 *logoutThings: 没有登录的回调事件
 *isHidden    : 是否隐藏所有提示对话框
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andWithoutLogin:(void (^)())logoutThings andHideProgressBar:(BOOL)isHidden;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring : 接口地址
 *parameters: 接口参数
 *isHidden  : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andHideSuccessMessage: (BOOL)isHidden;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring   : 接口地址
 *parameters  : 接口参数
 *logoutThings:没有登录的回调事件
 *isHidden    : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andWithoutLogin:(void (^)())logoutThings  andHideSuccessMessage: (BOOL)isHidden;

/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring : 接口地址
 *parameters: 接口参数
 *result    : 请求结果的回调函数
 *isHidden  : 是否隐藏所有提示对话框
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result andHideProgressBar:(BOOL) isHidden;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring   : 接口地址
 *parameters  : 接口参数
 *result      : 请求结果的回调函数
 *logoutThings:没有登录的回调事件
 *isHidden    : 是否隐藏所有提示对话框
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result  andWithoutLogin:(void (^)())logoutThings  andHideProgressBar:(BOOL) isHidden;

/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring : 接口地址
 *parameters: 接口参数
 *result    : 请求结果的回调函数
 *isHidden  : 是否隐藏所有提示对话框
 *vc        : 当前调用这个方法的view controller
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result andHideProgressBar:(BOOL) isHidden andVc:(UIViewController *)vc;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring : 接口地址
 *parameters: 接口参数
 *result    : 请求结果的回调函数
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring   : 接口地址
 *parameters  : 接口参数
 *logoutThings: 没有登录的回调事件
 *result      : 请求结果的回调函数
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result  andWithoutLogin:(void (^)())logoutThings;

/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring : 接口地址
 *parameters: 接口参数
 *result    : 请求结果的回调函数
 *vc        : 当前的view controller
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result andVc:(UIViewController *)vc;

/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring : 接口地址
 *parameters: 接口参数
 *result    : 请求结果的回调函数
 *isHidden  : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result andHideSuccessMessage: (BOOL)isHidden;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring   : 接口地址
 *parameters  : 接口参数
 *result      : 请求结果的回调函数
 *logoutThings: 没有登录的回调事件
 *isHidden    : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result andWithoutLogin:(void (^)())logoutThings andHideSuccessMessage: (BOOL)isHidden;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *handleDictory : 处理请求成功后返回数据的回调函数
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)( id dataDic)) handleDictory;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *logoutThings  : 没有登录的回调事件
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)( id dataDic)) handleDictory andWithoutLogin:(void (^)())logoutThings;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *isHidden      : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)( id dataDic)) handleDictory andHideSuccessMessage: (BOOL)isHidden;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *logoutThings  : 没有登录的回调事件
 *isHidden      : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)( id dataDic)) handleDictory andWithoutLogin:(void (^)())logoutThings andHideSuccessMessage: (BOOL)isHidden;

/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *isHidden      : 是否隐藏所有提示对话框
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)( id dataDic)) handleDictory andHideProgressBar:(BOOL) isHidden;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *logoutThings  : 没有登录的回调事件
 *isHidden      : 是否隐藏所有提示对话框
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)( id dataDic)) handleDictory andWithoutLogin:(void (^)())logoutThings andHideProgressBar:(BOOL) isHidden;

/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *result        : 请求结果的回调函数
 *handleDictory : 处理请求成功后返回数据的回调函数
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result handlerDictory:(void (^)(id dataDic)) handleDictory;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *result        : 请求结果的回调函数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *logoutThings  : 没有登录的回调事件
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)( BOOL isSuccess)) result handlerDictory:(void (^)(id dataDic)) handleDictory andWithoutLogin:(void (^)())logoutThings;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *result        : 请求结果的回调函数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *isHidden      : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)(BOOL isSuccess)) result handlerDictory:(void (^)(id dataDic)) handleDictory andHideSuccessMessage:(BOOL) isHidden;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *result        : 请求结果的回调函数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *logoutThings  : 没有登录的回调事件
 *isHidden      : 是否隐藏成功访问返回的提示框（其他形式则显示）
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)(BOOL isSuccess)) result handlerDictory:(void (^)(id dataDic)) handleDictory andWithoutLogin:(void (^)())logoutThings andHideSuccessMessage:(BOOL) isHidden;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *result        : 请求结果的回调函数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *isHidden      : 是否隐藏所有提示对话框
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)(BOOL isSuccess)) result handlerDictory:(void (^)(id dataDic)) handleDictory andHideProgressBar:(BOOL) isHidden;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring     : 接口地址
 *parameters    : 接口参数
 *result        : 请求结果的回调函数
 *handleDictory : 处理请求成功后返回数据的回调函数
 *logoutThings  : 没有登录的回调事件
 *isHidden      : 是否隐藏所有提示对话框
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)(BOOL isSuccess)) result handlerDictory:(void (^)(id dataDic)) handleDictory andWithoutLogin:(void (^)())logoutThings andHideProgressBar:(BOOL) isHidden;
/*
 *与之前的方法最大的区别是，Post方法
 *Urlstring      : 接口地址
 *parameters     : 接口参数
 *result         : 请求结果的回调函数
 *handleDictory  : 处理请求成功后返回数据的回调函数
 *logoutThings   : 没有登录的回调事件
 *isShowProgress : 是否显示请求进度提示对话框
 *isShowError    : 是否显示错误提示对话框
 *isShowSuccess  : 是否显示成功提示对话框
 */
+ (void)requestPostWith:(NSString *)Urlstring andParameters:(id)parameters andResult:(void (^)(BOOL isSuccess)) result handlerDictory:(void (^)(id dataDic)) handleDictory andWithoutLogin:(void (^)())logoutThings andShowProgress:(BOOL)isShowProgress andShowError:(BOOL) isShowError andShowSuccess:(BOOL)isShowSuccess;
#pragma mark - 特殊的请求方法
/*
 *这种方法可以得到所有接口返回的信息
 *目前仅适用于微信第三方登录时的get请求获取个人信息的方式
 *注意： 设置回复内容信息与以往使用的方式有不同，用的是："text/plain"，
 *      只有这样，针对微信第三方登录的请求才能获取数据成功
 */
+ (void)requestGetdata:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)(id dataDic)) handleDictory;
/*
 *这种方法可以得到所有接口返回的信息
 */
+ (void)requestWithdata:(NSString *)Urlstring andParameters:(id)parameters handlerDictory:(void (^)(id dataDic)) handleDictory;

@end
