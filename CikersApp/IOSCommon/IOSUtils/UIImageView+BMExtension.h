//
//  UIImageView+BMExtension.h
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

@interface UIImageView (BMExtension)

/**
 *  创建 UIImageView
 *
 *  @param frame    尺寸
 *  @param imageStr 图片名字(图片在项目中)
 */
+ (instancetype)dd_imageViewWithFrame:(CGRect)frame
                           imageStr:(NSString *)imageStr;

/**
 *  创建 UIImageView
 *
 *  @param frame     尺寸
 *  @param imageStr  图片名字(图片在项目中)
 *  @param tapAction 单击回调
 */
+ (instancetype)dd_imageViewWithFrame:(CGRect)frame
                              imageStr:(NSString *)imageStr
                             tapAction: ( void(^)(UIImageView *image))tapAction;
                              
                              
@end
