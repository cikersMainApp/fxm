//
//  UIDevice+Resolutions.h
//  apos-enterprise-ios
//
//  Created by cpz on 13-9-6.
//  Copyright (c) 2013年 cpz. All rights reserved.
//

#import <objc/NSObjCRuntime.h>
#import <UIKit/UIKit.h>
enum {
    // iPhone 1,3,3GS 标准分辨率(320x480px)
    UIDevice_iPhoneStandardRes      = 1,
    // iPhone 4,4S 高清分辨率(640x960px)
    UIDevice_iPhoneHiRes            = 2,
    // iPhone 5 高清分辨率(640x1136px)
    UIDevice_iPhoneTallerHiRes      = 3,
    // iPad 1,2 标准分辨率(1024x768px)
    UIDevice_iPadStandardRes        = 4,
    // iPad 3 High Resolution(2048x1536px)
    UIDevice_iPadHiRes              = 5,
    UIDevice_iPhone6              = 6,

    UIDevice_iPhone6s              = 7,

    UIDevice_iPhone8              = 8

}; typedef NSUInteger UIDeviceResolution;

@interface UIDevice (Resolutions){
    
}

/******************************************************************************
 函数名称 : + (UIDeviceResolution) currentResolution
 函数描述 : 获取当前分辨率
 输入参数 : N/A
 输出参数 : N/A
 返回参数 : N/A
 备注信息 :
 ******************************************************************************/
+ (UIDeviceResolution) currentResolution;

/******************************************************************************
 函数名称 : + (UIDeviceResolution) currentResolution
 函数描述 : 当前是否运行在iPhone5端
 输入参数 : N/A
 输出参数 : N/A
 返回参数 : N/A
 备注信息 :
 ******************************************************************************/
+ (BOOL)isRunningOniPhone5;

/******************************************************************************
 函数名称 : + (BOOL)isRunningOniPhone
 函数描述 : 当前是否运行在iPhone端
 输入参数 : N/A
 输出参数 : N/A
 返回参数 : N/A
 备注信息 :
 ******************************************************************************/
+ (BOOL)isRunningOniPhone;

/**
 *  是否越狱
 *
 *  @return
 */
+(BOOL)isJailBrokeDevice;

/**
 *  获取设备信息
 *
 *  @return
 */
+(NSString*) getDeviceModel;

/**
 *  获取设备蓝牙信息
 *
 *  @return
 */
+(NSString*) getBluetoothDeviceModel;


@end