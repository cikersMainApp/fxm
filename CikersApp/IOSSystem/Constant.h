//
//  Constant.h
//  LeRong
//
//  Created by Local on 15/11/7.
//  Copyright © 2015年 administrater. All rights reserved.
//

#ifndef Constant_h
#define Constant_h
#import "HLImageUtil.h"
#import "HLTableView.h"
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "HLAlertManager.h"
#import "APSProgress.h"
#import "HLKeyboardUtil.h"
#import "NSString+ThreeDESUtil.h"
#import "ToolUtil.h"
#define PHONE_NUMBER @"PHONE_NUMBER"
#define SUBJECT_COLOR [UIColor colorWithHexString:@"C0C0C0"]
#define DEVICE_VERSION  ([[UIDevice currentDevice].systemVersion doubleValue])

static NSString *const HOST = @"http://newstack.cikers.com:8080/cikersapi/";
static NSString *const HOST_IMAGE = @"http://www.cikers.com/";


#define DEBUGSTATE 1


/**
 *  屏幕宽高
 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height



/*
 预设字段
 */

//用户名
#define KEY_USER_NAME @"keyusername"
//密码
#define KEY_USER_PWD @"keyuserpwd"
//验证码
#define KEY_USER_VCODE @"keyuservcode"
//登录名
#define KEY_USER_LOGIN_NAME @"keyuserloginname"



/*
 网络发送标示字段
 */

// 球队注册标示
#define NET_TEAM_REG @"netteamreg"
// 球队上传图像
#define NET_TEAM_LOGO @"netteamlogo"

// 获取比赛信息
#define NET_MATCH_INFO @"netmatchinfo"

//在注册页面以及找回密码页面
#define TAG_TF_PHONE 1
#define TAG_TF_VCODE 2
#define TAG_TF_PWD 3


#import "DataSingleton.h"




#endif /* Constant_h */
