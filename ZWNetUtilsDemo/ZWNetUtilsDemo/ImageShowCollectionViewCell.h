//
//  ImageShowCollectionViewCell.h
//  YiKaoWang
//
//  Created by 科技晏语 on 16/5/19.
//  Copyright © 2016年 yykj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageShowCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageWidthConstraint;
@property (strong, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageHeightConstraint;
@property (strong, nonatomic) IBOutlet UIButton *deleteButton;

@end
