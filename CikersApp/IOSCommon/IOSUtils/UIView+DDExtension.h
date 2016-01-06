//
//  UIView+DDExtension.h
//  DDCategories
//
//  Created by Daredos on 15/12/10.
//  Copyright (c) 2015年 BlueMoon. All rights reserved.
//
/**
 *******************************************************
 *                                                      *
 * 感谢您的支持， 如果下载的代码在使用过程中出现BUG或者其他问题    *
 *                                                         *
 * 您可以发邮件到 asiosldh@163.com 或者 QQ 872304636            *
 *
 
 !!<< 随便总结了在项目中使用到的一些分类,以后会完善...
 
 *******************************************************
 */

#import <UIKit/UIKit.h>


@interface UIView (DDExtension)


@property (nonatomic, assign ,setter=dd_setX:)        CGFloat dd_x;
@property (nonatomic, assign ,setter=dd_setY:)        CGFloat dd_y;
@property (nonatomic, assign ,setter=dd_setWidth:)    CGFloat dd_width;
@property (nonatomic, assign ,setter=dd_setHeight:)   CGFloat dd_height;

@property (nonatomic, assign ,setter=dd_setOrigin:)   CGPoint dd_origin;
@property (nonatomic, assign ,setter=dd_setSize:)     CGSize dd_size;

@property (nonatomic, assign ,setter=dd_setCenterX:)  CGFloat  dd_centerX;
@property (nonatomic, assign ,setter=dd_setCenterY:)  CGFloat  dd_centerY;

@property (nonatomic, assign ,setter=dd_setCornerRadius:) CGFloat dd_cornerRadius;


@end
