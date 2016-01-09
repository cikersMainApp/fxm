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
#define SUBJECT_COLOR [UIColor colorWithHexString:@"2e3959"]
#define DEVICE_VERSION  ([[UIDevice currentDevice].systemVersion doubleValue])


#define COLOR_R 46
#define COLOR_G 57
#define COLOR_B 89

static NSString *const HOST = @"http://newstack.cikers.com:8080/cikersapi/";
static NSString *const HOST_IMAGE = @"http://www.cikers.com/";


#define DEBUGSTATE 1


//按钮蓝色色值

#define BNT_COLOR_BLUE @"1d6ade"

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
// 获取球队队员信息
#define NET_TEAM_PLAYER @"teamplayer"



// 获取比赛信息
#define NET_MATCH_INFO @"netmatchinfo"

// 获得精彩结果

#define NET_PREDICT_RESULT @"netPredictResult"

// 发送竞猜信息

#define NET_PREDICT_SEND @"netPredictSend"



//------------------------
// 比赛页面发送支持

#define NET_MATCH_VOTE_SEND @"netmatchvote"
// 比赛页面MVP投票
#define NET_MATCH_MVP_VOTE @"matchmvpvote"




// 获取帖子
#define NET_WIKI @"netwiki"

//在注册页面以及找回密码页面
#define TAG_TF_PHONE 1
#define TAG_TF_VCODE 2
#define TAG_TF_PWD 3



// 帖子类型

#define Wiki_type_solid @"solid"
#define Wiki_type_image @"image"
#define Wiki_type_video @"video"

#define   WIKI_TYPE_MESSAGE   = "message"; //平常贴
#define   WIKI_TYPE_EVENT    = "event"; // 活动贴
#define   WIKI_TYPE_PREDICTION  = "prediction"; //预测贴 将要被废弃掉
#define   WIKI_TYPE_MATCH    = "match"; //比赛贴
#define   WIKI_TYPE_MATCHREPORT  = "matchreport"; //战报贴


#import "DataSingleton.h"

#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height == 568) ? YES : NO)
#define IS_IPhone6 (667 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)
#define IS_IPhone6plus (736 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)





#endif /* Constant_h */
