//
//  Functions.h
//  ZWNetUtils
//
//  Created by Wanney on 15/8/29.
//  Copyright (c) 2015年 testWanney. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface Functions : NSObject
/**
 *  用于规避网络请求的字符串，并在为空的时候用一个可以设置的默认值来代替，避免程序因此崩溃
 */
+ (NSString *)getString:(NSString *)string withDefault:(NSString *)defaultString;
/**
 *  用于规避网络请求的字符串，并在为空的时候用一个可以设置的默认值来代替，避免程序因此崩溃
 *  并且，在做这步操作的同时，去除字符串中可能出现的不必要的空格，火车或者换行符的问题
 */
+ (NSString *)getStringWithClear:(NSString *)string withDefault:(NSString *)defaultString;
/**
 *  判断字符串是否为空
 *  主要用于规避从网络上请求的字符串为空的情况有多种
 */
+ (BOOL)isEmptyWithString:(NSString *)string;
/**
 *  获取用户id
 */
+ (NSString *)getUserId;
/**
 *  保存用户id
 */
+ (void)saveUserId:(NSString *)userId;
/**
 *  获取token
 */
+ (NSString *)getToken;
/**
 *  保存token
 */
+ (void)saveToken:(NSString *)userId;
/**
 *  保存经纬度
 */
+ (void)saveLongitude:(NSString *)longitude andLatitude:(NSString *)latitude;
/**
 *  获取管理员id
 */
+ (NSString *)getAdminId;
/**
 *  保存管理员id
 */
+ (void)saveAdminId:(NSString *)userId;
/**
 *  获取用户名
 */
+ (NSString *)getUserName;
/**
 *  保存用户名
 */
+ (void)saveUserName:(NSString *)userName;
/**
 *  去除tableview底部多余的线条
 */
+ (void)clearExtraLine :(UITableView *)tableView;
/**
 *  验证邮箱是否有效
 */
+ (BOOL)isValidateEmail :(NSString *)email;
/**
 *  把任何对象都转化成字符串，主要用于nsnumber型的转化
 */
+ (NSString *)toString:(id)anyObject;
/**
 *  清除字符串中不必要的.和空格
 */
+ (NSString *)clearBlankSpaceAndExtraPoint:(NSString *)string;
/**
 *  清除字符串中不必要的回车和换行符
 */
+ (NSString *)clearExtraEntrtKey:(NSString *)string;

+ (NSString *)autoAddBaseUrl:(NSString *)baseUrl withUrl:(NSString *)urlString;
/**
 *  判断图片路径，如果没有根路径，便加上
 */
+ (NSString *)autoAddImageBaseUrl:(NSString *)imageBaseUrl withUrl:(NSString *)urlString;

+ (BOOL)resignedKeyBoard:(UITextField *)textField;

+ (BOOL)resignedTvKeyBoard:(UITextView *)textView;
/**
 *  对应格式的表示时间的字符串转化为时间戳
 *  这里的格式是：YYYY-MM-dd HH:mm:ss
 *  @param str
 *
 *  @return
 */
+ (NSString *)getTimeFromString :(NSString *) str;
/**
 *  针对浮点型转化成字符串，小数点后面会有六位的情况
 *  将小数点有六位的情况变成只有一位的情况
 *  @param floatNumber 浮点型
 *
 *  @return
 */
+ (NSString *)getStringFormFloat:(float)floatNumber;
/**
 *  js的文字html化，防止在显示网页内容时出现乱码现象
 */
+ (NSString *)htmlEntityDecode: (NSString *)str;
/**
 *  初始化界面导航栏，以保证符合对应app主题风格
 *
 *  @param vc 对应的界面
 */
+ (void)changeTheNaviBarColor:(UIViewController *)vc WithSystemColor:(UIColor *)color;

+ (void)setRoundImageView:(UIImageView *)imageView;

+ (NSString *)changeTheDateFormatWithStr:(NSString *)dateStr;
/**
 *  验证密码是否符合格式要求
 */
+ (BOOL)qualifiedCodeFormat:(NSString *)code;

+ (NSString *) getSexStringForShow:(id)sex;

+ (NSString *) getDateFormatYYYYMMDDWith:(NSString *)timeStamp;

+ (NSString *) getDateFormatYYYYMMDDHHMMSSWith:(NSString *)timeStamp;
/**
 *  判断下标index是否超出了数据的范围
 *  防止出现范围越界的bug
 *  @param arr   数组
 *  @param index 下标
 *
 */
+ (BOOL) isOutOfRangeArray:(NSArray *)arr withSetTheIndex:(NSInteger)index;
/**
 *  将时间戳按对应格式将其转化为字符串
 *
 *  @param time      时间戳
 *  @param format    字符串显示的格式如：“yyyy-MM-dd HH:mm”
 *
 *  @return 表示时间的字符串：如2016-01-25 08:00
 */
+ (NSString *) getDateFormat:(NSString *)format Datetime:(NSString *)time;
/**
 *  根据字符串长度，获取label、textview等完整显示该文本所需的高度
 *
 *  @param testStr 需要显示的字符串
 *  @param Size    显示的字符串字体大小
 *  @param width   距离屏幕两边的宽度总和，这个参数可以帮组计算出文本的最大显示宽度
 *
 *  @return 控件label、textview的所需高度
 */
+ (CGSize)getAutoHeight:(NSString *)testStr andFontOfSize:(int)Size andExtrawidth:(float)width;
/**
 *  将对应界面上的输入框收回
 *  能够解决在弹出输入框的情况下，如果发生页面跳转，会使得没有收回的输入框无法被收回的问题
 *  @param fatherView 对面界面上所有能弹出输入框的textfield的父view，基本上使用:self.view就可以了
 */
+ (void) resignAllText:(UIView *)fatherView;
/**
 *  将源图片的大小与传入的maxSize进行比较，如果图片大小超过这个限制，就将图片按合适比例压缩后转化成二进制的nsdata
 *  用途：主要用于上传图片时，保证图片的大小能够满足网络上传对文件大小的限制
 *  @param source_image 源图片
 *  @param maxSize      大小限制
 *
 *  @return 上传所需的二进制文件
 */
+ (NSData *)resetSizeOfImageData:(UIImage *)source_image maxSize:(NSInteger)maxSize;
/**
 *  将时间戳按对应格式将其转化为字符串
 *
 *  @param timeStamp 时间戳
 *  @param format    字符串显示的格式如：“yyyy-MM-dd HH:mm”
 *
 *  @return 表示时间的字符串：如2016-01-25 08:00
 */
+ (NSString *) getDate:(NSString *)timeStamp WithFormat:(NSString *)format;
/**
 *  将接口返回的格式为：“经度，纬度”的字符串转化成CLLocationCoordinate2D的坐标点
 *
 *  @param str “经度，纬度”的字符串
 *
 *  @return 坐标点
 */
+ (CLLocationCoordinate2D) getTheAddressLngWith:(NSString *)str;//格式为：经度，纬度
/**
 *  设置BarButtonItem按钮的特殊字体
 *
 *  @param barBtnItem BarButtonItem
 *  @param size       字体大小
 *  @param font       字体
 */
+ (void) setTextFontWith:(NSString *)font
           andBarBtnItem:(UIBarButtonItem *)barBtnItem
                 andSize:(CGFloat)size;
/**
 *  设置按钮的特殊字体
 *
 *  @param button   按钮
 *  @param str      字符串
 *  @param size     字体大小
 *  @param range    eg. NSMakeRange(6, 1)//从第6个字开始，长度为1
 *  @param color    颜色
 *  @param tinColor tin颜色
 *  @param font     字体大小
 */
+ (void) setButtonIcon:(UIButton *)button
            withString:(NSString *)str
               andSize:(CGFloat)size
              andRange:(NSRange)range
              andColor:(UIColor *)color
           andTinColor:(UIColor *)tinColor
               andFont:(NSString *)font;

/**
 *  同一个label 给内容设置不同的颜色和字体
 *
 *  @param label
 *  @param font    eg. [UIFont systemFontOfSize:15]
 *  @param range   eg. NSMakeRange(6, 1)//从第6个字开始，长度为1
 *  @param vaColor eg. UIColor
 */
+ (void) fuwenbenLabel:(UILabel *)label
            FontNumber:(id)font
              AndRange:(NSRange)range
              AndColor:(UIColor *)vaColor;
/**
 *  将html格式的文本转化为具有格式正常的文本
 *
 *  @param htmlStr
 *
 *  @return
 */
+ (NSString *) getStrFromHtmlContent:(NSString *)htmlStr;
#pragma mark - AppDelegate的设置
/**
 *  初始化keyboard
 */
+ (void) initIQKeyBoard;
/**
 *  初始化Xcode_Colors
 */
+ (void) enableColorLog;
/**
 *  开启网络指示器
 */
+ (void)checkNetWorkingState;
/**
 *  极光推送集成
 *  新版2.1.6
 *  @param launchOptions
 */
+ (void) jPushAddAndOptions:(NSDictionary *)launchOptions andHandleNoteDict:(void (^)( id dataDic)) handleNoteDict;
@end
