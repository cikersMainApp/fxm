//
//  SingleManageVC.h
//  CikersApp
//
//  Created by fxm on 16/1/21.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    Module_Player,
    Module_Team,
    Module_Tounament,
    Module_Match,
    Modul_WikiToMatch,
    Module_Search,
    Module_Wiki,
    Module_User,
} MODULETYPE;


@interface SingleManageVC : NSObject


+(UINavigationController*)getCurNavigation;

+(id)getCurViewControl;

+(void)pushOtherModuleByNav:(id)nav nextNav:(id)nextnav type:(NSInteger)type data:(id)data;

@end
