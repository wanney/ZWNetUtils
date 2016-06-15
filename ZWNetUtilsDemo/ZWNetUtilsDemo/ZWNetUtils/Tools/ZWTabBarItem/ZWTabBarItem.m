//
//  ZWTabBarItem.m
//  YiKaoWang
//
//  Created by 晏语科技 on 16/4/25.
//  Copyright © 2016年 yykj. All rights reserved.
//

#import "ZWNetUtils.h"
@implementation ZWTabBarItem
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.image = [self.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.selectedImage = [self.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self setTitleTextAttributes:@{NSForegroundColorAttributeName : [self mostColorWithImage:self.image]} forState:UIControlStateNormal];
        [self setTitleTextAttributes:@{NSForegroundColorAttributeName : [self mostColorWithImage:self.selectedImage]} forState:UIControlStateSelected];
    }
    return self;
}

- (UIColor *) mostColorWithImage : (UIImage *)image{
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
    
    //第一步 先把图片缩小  加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize = CGSizeMake(50, 50);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);
    //第二步 取每个点的像素值
    unsigned char * data = CGBitmapContextGetData(context);
    
    if (data == NULL) {
        return nil;
    }
    
    NSCountedSet * cls = [NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    
    for (int x = 0; x < thumbSize.width; x ++) {
        for (int y = 0; y < thumbSize.height; y ++) {
            int offset = 4*(x*y);
            
            int red = data[offset];
            int green = data[offset + 1];
            int blue = data[offset + 2];
            int alpha = data[offset + 3];
            
            if (alpha != 255) {
                continue;
            }
            NSArray * clr = @[@(red),@(green),@(blue),@(alpha)];
            [cls addObject:clr];
        }
    }
    CGContextRelease(context);
    
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator * enumerator = [cls objectEnumerator];
    NSArray * curColor = nil;
    
    NSArray * maxColor = nil;
    NSUInteger maxCount = 0;
    
    while ((curColor = [enumerator nextObject]) != nil) {
        NSUInteger tmpCount = [cls countForObject:curColor];
        
        if (tmpCount < maxCount) {
            continue;
        }
        
        maxCount = tmpCount;
        maxColor = curColor;
    }
//    LogRed(@"red: %@ , green: %@ , blue : %@.",maxColor[0],maxColor[1],maxColor[2]);
//    LogRed(@"max.count -> %ld",(long)maxColor.count);
    //图片计算和处理过程中可能会出现问题，因此当count ＝ 0 的时候返回默认的白色。
    if (maxColor.count > 0) {
        return [UIColor colorWithRed:([maxColor[0] intValue]/255.0f) green:([maxColor[1] intValue]/255.0f) blue:([maxColor[2] intValue]/255.0f) alpha:1.0];
    }else{
        return [UIColor whiteColor];
    }
    
}

@end
