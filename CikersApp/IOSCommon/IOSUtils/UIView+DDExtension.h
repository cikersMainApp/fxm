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


@property (nonatomic, assign ,setter=coustom_setX:)        CGFloat coustom_x;
@property (nonatomic, assign ,setter=coustom_setY:)        CGFloat coustom_y;
@property (nonatomic, assign ,setter=coustom_setWidth:)    CGFloat coustom_width;
@property (nonatomic, assign ,setter=coustom_setHeight:)   CGFloat coustom_height;

@property (nonatomic, assign ,setter=coustom_setOrigin:)   CGPoint coustom_origin;
@property (nonatomic, assign ,setter=coustom_setSize:)     CGSize coustom_size;

@property (nonatomic, assign ,setter=coustom_setCenterX:)  CGFloat  coustom_centerX;
@property (nonatomic, assign ,setter=coustom_setCenterY:)  CGFloat  coustom_centerY;

@property (nonatomic, assign ,setter=coustom_setCornerRadius:) CGFloat coustom_cornerRadius;


@end
