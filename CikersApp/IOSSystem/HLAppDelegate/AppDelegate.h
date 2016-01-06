//
//  AppDelegate.h
//  TeaLife
//
//  Created by administrater on 15/12/2.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIResponder * currentResponder;

+(void) setLoginRoot;
+(void) setTabRoot;
+(void) setTeamRoot;
+(void) setGameRoot;
+(void) setTeamCreat;
+(void) setPlayerinfoRoot;
@end

