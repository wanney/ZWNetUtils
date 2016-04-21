//
//  DLRadioButton.h
//  DLRadioButtonExample
//
//  Created by Liu, Xingruo on 8/22/14.
//

#import <UIKit/UIKit.h>

/**
 A hightly customizable Radio Button for iOS
*/
@interface DLRadioButton : UIButton

/**@name Properties*/
/**
 Container for holding other related radio buttons
*/
@property (nonatomic) IBOutletCollection(DLRadioButton) NSArray *otherButtons;
/**
 Image for radio button (optional)
*/
@property (nonatomic) UIImage *ButtonIcon;
/**
 Image for radio button when selected (optional)
*/
@property (nonatomic) UIImage *ButtonIconSelected;
/**
 Height of the radio button
*/
@property (nonatomic) CGFloat buttonSideLength;
/**
 Margin width between button icon and button title
 */
@property (nonatomic) CGFloat rightMarginWidth;
/**
 Color of the circle button icon
*/
@property (nonatomic) UIColor *circleColor;
/**
 Radius of the circle button icon
*/
@property (nonatomic) CGFloat circleRadius;
/**
 Stroke width of circle button icon
 */
@property (nonatomic) CGFloat circleStrokeWidth;
/**
 Color of selection indicator
*/
@property (nonatomic) UIColor *indicatorColor;
/**
 Radius of selection indicator
*/
@property (nonatomic) CGFloat indicatorRadius;

/**
 Clear selection for all the buttons
*/
- (void)deselectOtherButtons;
/**
 @return Current selected button
*/
- (DLRadioButton *)selectedButton;

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
