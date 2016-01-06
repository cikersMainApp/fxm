//
//  UIBarButtonItem+BMExtension.h
//  BMDeliverySpecialists
//
//  Created by fenglh on 15/10/26.
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

@interface UIBarButtonItem (BMExtension)

/**
 *  创建一个文字  item
 *
 *  @param frame      frame
 *  @param title      文字
 *  @param titleColor 文字颜色
 *  @param tapAction  回调
 */
+ (instancetype)dd_barButtonItemTitleWithFrame:(CGRect )frame
                                         title:(NSString *)title
                                    titleColor:(UIColor *)titleColor
                                          font:(UIFont *)font
                                     tapAction:(dispatch_block_t)tapAction;
@end
