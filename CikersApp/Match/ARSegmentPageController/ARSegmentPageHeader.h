//
//  ARSegmentPageHeader.h
//  ARSegmentPager
//
//  Created by August on 15/3/28.
//  Copyright (c) 2015年 August. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARSegmentPageControllerHeaderProtocol.h"
#import "CustomHeader.h"
@interface ARSegmentPageHeader : UIView<ARSegmentPageControllerHeaderProtocol>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *img_left;
@property (nonatomic, strong) UIImageView *img_right;
@property (nonatomic, strong) CustomHeader *view_bg;


@end