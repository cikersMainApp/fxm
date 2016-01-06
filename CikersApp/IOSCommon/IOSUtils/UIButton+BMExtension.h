//
//  UIButton+BMExtension.h
//  BMDeliverySpecialists
//
//  Created by fenglh on 15/10/29.
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


typedef void(^TapButtonActionBlock) (UIButton *button) ;



@interface UIButton (BMExtension)

/**
 *  快速创建文字Button
 *
 *  @param frame           frame
 *  @param title           title
 *  @param backgroundColor 背景颜色
 *  @param titleColor      文字颜色
 *  @param tapAction       回调
 */
+ (instancetype)dd_buttonCustomButtonWithFrame:(CGRect)frame
                                         title:(NSString *)title
                               backgroundColor:(UIColor *)backgroundColor
                                    titleColor:(UIColor *)titleColor
                                     tapAction:(TapButtonActionBlock)tapAction;
/**
 *   快速创建图片Button
 *
 *  @param frame       frame
 *  @param imageString 按钮的背景图片
 *  @param tapAction   回调
 */
+ (instancetype)dd_buttonSystemButtonWithFrame:(CGRect)frame
                   NormalBackgroundImageString:(NSString *)imageString
                                     tapAction:(TapButtonActionBlock)tapAction;

@end
