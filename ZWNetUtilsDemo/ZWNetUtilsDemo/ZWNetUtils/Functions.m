//
//  Functions.m
//  ZWNetUtils
//
//  Created by Wanney on 15/8/29.
//  Copyright (c) 2015年 testWanney. All rights reserved.
//

#import "ZWNetUtils.h"

@implementation Functions
/*
 *功能说明：
 *    为了避免从网络上得到不是预期的字段而使得后续处理出现问题，而做的一个过滤
 *参数说明：
 *string : 需要过滤处理的字符串并去掉多余的空格等
 *defaultString : 不符合条件时的默认字符串
 */
+ (NSString *)getString:(NSString *)string withDefault:(NSString *)defaultString{
 
    if([Functions isEmptyWithString:string]
       ){
        //为空，返回默认数据
        return defaultString;
    }else{
        //不为空，直接返回数据
        return string;
    }
}
/*
 *功能说明：
 *    为了避免从网络上得到不是预期的字段而使得后续处理出现问题，而做的一个过滤
 *参数说明：
 *string : 需要过滤处理的字符串
 *defaultString : 不符合条件时的默认字符串
 */
+ (NSString *)getStringWithClear:(NSString *)string withDefault:(NSString *)defaultString{
    
    if([Functions isEmptyWithString:string]
       ){
        //为空，返回默认数据
        return defaultString;
    }else{
        //不为空，直接返回数据
        return [self clearExtraEntrtKey:string];
    }
}

/*
 *功能说明：
 *    判断字符串为空
 *参数说明：
 *string : 需要判断的字符串
 */
+ (BOOL)isEmptyWithString:(NSString *)string{
    return ((string == nil)
            ||([string isEqual:[NSNull null]])
            ||([string isEqualToString:@"<null>"])
            ||([string isEqualToString:@"(null)"])
            ||([string isEqualToString:@" "])
            ||([string isEqualToString:@""])
            ||([string isEqualToString:@""])
            ||([string isEqualToString:@"(\n)"])
            ||([string isEqualToString:@"yanyu"])
            );
}
/*
 *功能说明：
 *   得到登录状态需要保存的userid的键值
 */

+ (NSString *)getUserId{
    return [Functions getString:[[NSUserDefaults standardUserDefaults] objectForKey:UserId] withDefault:@""];
}

/*
 *功能说明：
 *   为了保持登录状态而保存的userid的键值
 *参数说明：
 *userId : 需要保存的字符串
 */
+ (void)saveUserId:(NSString *)userId{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userId forKey:UserId];
    [defaults synchronize];
}

/*
 *功能说明：
 *   得到登录状态需要保存的token的键值
 */

+ (NSString *)getToken{
    return [Functions getString:[[NSUserDefaults standardUserDefaults] objectForKey:Token] withDefault:@""];
//    return @"MTQ1ODAzMjEzMpqqgaq6oJahno9sr46YdHU";
}

/*
 *功能说明：
 *   为了保持登录状态而保存的token的键值
 *参数说明：
 *token : 需要保存的字符串
 */
+ (void)saveToken:(NSString *)token{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:token forKey:Token];
    [defaults synchronize];
}


+ (void)saveLongitude:(NSString *)longitude andLatitude:(NSString *)latitude{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:longitude forKey:Longitude];
    [defaults setObject:latitude forKey:Latitude];
    [defaults synchronize];
}

/*
 *功能说明：
 *   得到登录状态需要保存的userid的键值
 */
+ (NSString *)getAdminId{
    return [[NSUserDefaults standardUserDefaults] objectForKey:AdminId];
}

/*
 *功能说明：
 *   为了保持登录状态而保存的userid的键值
 *参数说明：
 *userId : 需要保存的字符串
 */
+ (void)saveAdminId:(NSString *)userId{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userId forKey:AdminId];
    [defaults synchronize];
}

+ (NSString *)getUserName{
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserName];
}

+ (void)saveUserName:(NSString *)userName{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userName forKey:UserName];
    [defaults synchronize];
}

#pragma mark - 去掉多余的线
+ (void)clearExtraLine :(UITableView *)tableView{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}


//测试注册的邮箱是否符合要求
+ (BOOL)isValidateEmail :(NSString *)email
{
    return NO;
}

+ (NSString *)toString:(id)anyObject{
    return [NSString stringWithFormat:@"%@",anyObject];
}

+ (NSString *)clearBlankSpaceAndExtraPoint:(NSString *)string{
    NSString * mString = nil;
    //去除里面的空格用‘_’代替
    NSString *strtemp = [string stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    //去除里面的'-'用‘_’代替
    NSString *strUrl = [strtemp stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    //去除里面多余的点，也用‘_’代替
    mString = [strUrl stringByReplacingOccurrencesOfString:@"." withString:@"_"];
    return mString;
}

+ (NSString *)clearExtraEntrtKey:(NSString *)string{
    NSString * mString = nil;
    NSString *strtemp = [string stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    mString = [strtemp stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return mString;
}

+ (NSString *)autoAddBaseUrl:(NSString *)baseUrl withUrl:(NSString *)urlString{
    if (![Functions isEmptyWithString:urlString]){
        if ([urlString rangeOfString:baseUrl].location == NSNotFound) {
            urlString = [baseUrl stringByAppendingString:urlString];
        }
        return urlString;
    }else{
        return @"";
    }
}

+ (NSString *)autoAddImageBaseUrl:(NSString *)imageBaseUrl withUrl:(NSString *)urlString{
    if (![Functions isEmptyWithString:urlString]){
        if ([urlString rangeOfString:imageBaseUrl].location == NSNotFound) {
            urlString = [imageBaseUrl stringByAppendingString:urlString];
        }
        return urlString;
    }else{
        return @"";
    }
}

+ (BOOL) resignedKeyBoard:(UITextField *)textField{
    return [textField resignFirstResponder];
}

+ (BOOL) resignedTvKeyBoard:(UITextView *)textView{
    return [textView resignFirstResponder];
}

+ (NSString *) getTimeFromString :(NSString *) str{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[str integerValue]];
    return [formatter stringFromDate:confromTimesp];
}

+ (NSString *)getStringFormFloat:(float)floatNumber{
    NSString * strTemp = [NSString stringWithFormat:@"%.1f",floatNumber];
    return strTemp;
}

+ (NSString *)htmlEntityDecode: (NSString *)str{
    str = [str stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    str = [str stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    str = [str stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    str = [str stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    str = [str stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    str = [str stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@"\n"];
    return str;
}

+ (void)changeTheNaviBarColor:(UIViewController *)vc WithSystemColor:(UIColor *)color{
    //修改背景色
    vc.navigationController.navigationBar.barTintColor = color;
    //修改标题色
    [vc.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
    //修改按钮颜色
    [vc.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    //去掉默认回退键之后的标题
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    //改变通知栏字体的颜色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

+ (void) setRoundImageView:(UIImageView *)imageView{
    imageView.clipsToBounds  = YES;
    [imageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
    [imageView.layer setCornerRadius:(imageView.frame.size.height/2)];
    [imageView.layer setMasksToBounds:YES];
    [imageView setContentMode:UIViewContentModeScaleAspectFill];
    [imageView setClipsToBounds:YES];
    imageView.layer.shadowColor = [UIColor clearColor].CGColor;
    imageView.layer.shadowOffset = CGSizeMake(1, 1);
    imageView.layer.shadowOpacity = 0.5;
    imageView.layer.shadowRadius = 2.0;
    imageView.layer.borderColor = [[UIColor clearColor] CGColor];
    imageView.layer.borderWidth = 2.0f;
    imageView.userInteractionEnabled = YES;
    imageView.backgroundColor = [UIColor clearColor];
}

+ (NSString *) changeTheDateFormatWithStr:(NSString *)dateStr{
    NSString * strTemp;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *dateTemp = [formatter dateFromString:dateStr];
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateStyle:NSDateFormatterMediumStyle];
    [formatter2 setTimeStyle:NSDateFormatterShortStyle];
    [formatter2 setDateFormat:@"MM月dd日 HH:mm"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone2 = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter2 setTimeZone:timeZone2];
    strTemp = [formatter2 stringFromDate:dateTemp];
    return strTemp;
}

+ (BOOL)qualifiedCodeFormat:(NSString *)code{
    if (code.length) {
        if (code.length >= 6 && code.length <= 16) {
            return TRUE;
        }else
            return FALSE;
    }
    return FALSE;
}

+ (NSString *) getSexStringForShow:(id)sex{
    NSString * sexStr;
    if (![Functions isEmptyWithString:sex]) {
        if([sex isKindOfClass:[NSString class]]){
            if ([sex isEqualToString:@"0"]) {
                sexStr = @"男";
            }else{
                sexStr = @"女";
            }
        }
    }else{
        if([sex isKindOfClass:[NSNumber class]]){
            if([sex isEqualToNumber:@0]){
                sexStr = @"男";
            }else{
                sexStr = @"女";
            }
        }
    }
    return sexStr;
}

+ (NSString *) getDateFormatYYYYMMDDWith:(NSString *)timeStamp{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timeStamp longLongValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY年MM月dd日"];
    NSString *dateStr = [formatter stringFromDate:confromTimesp];
    return dateStr;
}

+ (NSString *) getDateFormatYYYYMMDDHHMMSSWith:(NSString *)timeStamp{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timeStamp longLongValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *dateStr = [formatter stringFromDate:confromTimesp];
    return dateStr;
}

+ (NSString *) getDate:(NSString *)timeStamp WithFormat:(NSString *)format{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timeStamp longLongValue]];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    NSString *dateStr = [formatter stringFromDate:confromTimesp];
    return dateStr;
}

+ (BOOL) isOutOfRangeArray:(NSArray *)arr withSetTheIndex:(NSInteger)index{
    if (index < 0) {
        return YES;
    }else if(index >= arr.count){
        return YES;
    }else
        return NO;
}

+(NSString *)getDateFormat:(NSString *)format Datetime:(NSString *)time{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)[time intValue]];
    NSString * confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

+ (CGSize)getAutoHeight:(NSString *)testStr andFontOfSize:(int)Size andExtrawidth:(float)width{
    UIFont * tfont = [UIFont systemFontOfSize:Size];
    //高度估计文本大概要显示几行，宽度根据需求自己定义。 MAXFLOAT 可以算出具体要多高
    CGSize size = CGSizeMake(ZWidth - width,MAXFLOAT);
    //    获取当前文本的属性
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:tfont,NSFontAttributeName,nil];
    //ios7方法，获取文本需要的size，限制宽度
    CGSize  actualsize = [testStr boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
    //   更新UILabel的frame
    return actualsize;
}

+ (void) resignAllText:(UIView *)fatherView{
    UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    [fatherView addSubview:textField];
    [fatherView insertSubview:textField atIndex:0];
    [textField becomeFirstResponder];
    [textField resignFirstResponder];
}

+ (NSData *)resetSizeOfImageData:(UIImage *)source_image maxSize:(NSInteger)maxSize
{
    //先调整分辨率
    CGSize newSize = CGSizeMake(source_image.size.width, source_image.size.height);
    CGFloat tempHeight = newSize.height / 1024;
    CGFloat tempWidth = newSize.width / 1024;
    
    if (tempWidth > 1.0 && tempWidth > tempHeight) {
        newSize = CGSizeMake(source_image.size.width / tempWidth, source_image.size.height / tempWidth);
    }
    else if (tempHeight > 1.0 && tempWidth < tempHeight){
        newSize = CGSizeMake(source_image.size.width / tempHeight, source_image.size.height / tempHeight);
    }
    
    UIGraphicsBeginImageContext(newSize);
    [source_image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //调整大小
    NSData *imageData = UIImageJPEGRepresentation(newImage,1.0);
    NSUInteger sizeOrigin = [imageData length];
    NSUInteger sizeOriginKB = sizeOrigin / 1024;
    if (sizeOriginKB > maxSize) {
        NSData *finallImageData = UIImageJPEGRepresentation(newImage,0.50);
        return finallImageData;
    }
    return imageData;
}

+ (CLLocationCoordinate2D) getTheAddressLngWith:(NSString *)str{
    
    NSArray * arrTemp = [str componentsSeparatedByString:@","];
    CLLocationDegrees latitude = [(NSString *)arrTemp[0] doubleValue];
    CLLocationDegrees longitude = [(NSString *)arrTemp[1] doubleValue];
    CLLocationCoordinate2D point = CLLocationCoordinate2DMake(latitude, longitude);
    return point;
}

+ (void) setTextFontWith:(NSString *)font andBarBtnItem:(UIBarButtonItem *)barBtnItem andSize:(CGFloat)size{
    NSDictionary *fontDic=@{
                            NSForegroundColorAttributeName:[UIColor whiteColor],
                            NSFontAttributeName:[UIFont fontWithName:font size:size],  //粗体
                            };
    [barBtnItem setTitleTextAttributes:fontDic
                              forState:UIControlStateNormal];
    [barBtnItem setTitleTextAttributes:fontDic
                              forState:UIControlStateHighlighted];
}

+ (void) setButtonIcon:(UIButton *)button  withString:(NSString *)str andSize:(CGFloat)size andRange:(NSRange)range andColor:(UIColor *)color andTinColor:(UIColor *)tinColor andFont:(NSString *)font{
    NSDictionary *fontWhiteDic=@{
                                 NSForegroundColorAttributeName:color,
                                 NSFontAttributeName:[UIFont fontWithName:font size:size],  //粗体
                                 };
    NSDictionary *fontRedDic=@{
                               NSForegroundColorAttributeName:tinColor,
                               NSFontAttributeName:[UIFont fontWithName:font size:size],  //粗体
                               };
    NSMutableAttributedString *attriLikeNormalString = [[NSMutableAttributedString alloc] initWithString:str];
    [attriLikeNormalString addAttributes:fontWhiteDic
                                   range:range];
    NSMutableAttributedString *attriLikeSelectedString = [[NSMutableAttributedString alloc] initWithString:str];
    [attriLikeSelectedString addAttributes:fontRedDic
                                     range:range];
    [button setAttributedTitle:attriLikeNormalString forState:UIControlStateNormal];
    [button setAttributedTitle:attriLikeSelectedString forState:UIControlStateHighlighted];
}

+ (void)fuwenbenLabel:(UILabel *)label FontNumber:(id)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:label.text];
    //设置字号
    [str addAttribute:NSFontAttributeName value:font range:range];
    //设置文字颜色
    [str addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    label.attributedText = str;
}

+ (NSString *) getStrFromHtmlContent:(NSString *)htmlStr{
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithData:[htmlStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    UITextView * myTextView =  [[UITextView alloc]init];
    [myTextView setAttributedText:attrStr];
    return myTextView.text;
}

+ (void) initIQKeyBoard{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES; //控制整个功能是否启用。
    manager.shouldResignOnTouchOutside = YES;//控制点击背景是否收起键盘
    manager.shouldToolbarUsesTextFieldTintColor = YES;// 控制键盘上的工具条文字颜色是否用户自定义。
    manager.enableAutoToolbar = YES;//提供的键盘上面默认会有“前一个”“后一个”“完成”这样的辅助按钮
    manager.toolbarManageBehaviour = IQAutoToolbarBySubviews;
    //如果有多个输入框，那么我们在输入的时候可以通过点击在Toolbar中的“前一个”“后一个”按钮来实现移动到不同的输入框。
    //可是输入框的移动肯定是有一个规律的。这里就提供了两个方式:
    //第一种就是加入的顺序 : IQAutoToolbarBySubviews
    //第二种就是按照Tag值的大小排序 : IQAutoToolbarByTag
    manager.shouldShowTextFieldPlaceholder = YES;//如果输入框有placeholder的话，那么在toolbar中默认会显示出来。
}

+ (void) enableColorLog{
    setenv("XcodeColors", "YES", 0);
    char *xcode_colors = getenv("XcodeColors");
    if (xcode_colors && (strcmp(xcode_colors, "YES") == 0))
    {
        // XcodeColors is installed and enabled!
        LogRed(@"The Xcode Colors is installed and enable!");
    }else{
        LogRed(@"The Xcode Colors is uninstalled or disable!");
    }
}

+ (void)checkNetWorkingState{
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
    NSOperationQueue *operationQueue       = manager.operationQueue;
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                NSLog(@"有网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [operationQueue setSuspended:YES];
                NSLog(@"无网络");
                break;
        }
    }];
    // 开始监听
    [manager.reachabilityManager startMonitoring];
}
@end
