//
//  SingleManageVC.m
//  CikersApp
//
//  Created by fxm on 16/1/21.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "SingleManageVC.h"
#import "MainSearchHotpacks.h"
#import "HLNavgationController.h"
#import "TounamentBaseVC.h"
#import "TounamentVC.h"
#import "TeamBaseVC.h"
#import "TeamMainVC.h"
#import "MatchVC.h"
#import "PlayerBaseVC.h"
#import "PlayerMainVC.h"

#import "GameLeftVC.h"
#import "DicGameinfo.h"
#import "DicTeaminfo.h"
#import "DicPlayerinfo.h"
#import "DicSearch.h"
#import "DicTags.h"
#import "DicMatchinfo.h"
#import "DicUserinfo.h"
@implementation SingleManageVC

+(void)pushOtherModuleByNav:(id)nav nextNav:(id)nextnav type:(NSInteger)type data:(id)data
{

    switch (type) {
        case Module_Player:
        {
            
            DicPlayerinfo *info = (DicPlayerinfo*)data;
            
            HLNavgationController *  loginNav =  [[UIStoryboard storyboardWithName:@"Playerinfo" bundle:nil] instantiateViewControllerWithIdentifier:@"playerinfo"];
            
            
            GameLeftVC *leftVC = [[GameLeftVC alloc] init];
            
            PlayerMainVC *  nextvc =  [[UIStoryboard storyboardWithName:@"Playerinfo" bundle:nil] instantiateViewControllerWithIdentifier:@"playermainvc"];
            
            nextvc.num_id = info.id;
            
            TeamBaseVC * rootvc = (TeamBaseVC*)loginNav.visibleViewController;
            
            rootvc = [rootvc initWithLeftViewController:leftVC centerViewController:nextvc];
            
            [(UINavigationController*)nav pushViewController:rootvc animated:YES];
            
            loginNav.navigationItem.title = @"球员详情";

        }
            break;
            
        case Module_Team:
        {
            DicTeaminfo *info = (DicTeaminfo*)data;

            HLNavgationController *  loginNav =  [[UIStoryboard storyboardWithName:@"Team" bundle:nil] instantiateViewControllerWithIdentifier:@"team"];
            
            GameLeftVC *leftVC = [[GameLeftVC alloc] init];
            
            TeamMainVC *  nextvc =  [[UIStoryboard storyboardWithName:@"Team" bundle:nil] instantiateViewControllerWithIdentifier:@"teammainvc"];
            
            nextvc.data_obj_info = info;
            
            TeamBaseVC * rootvc = (TeamBaseVC*)loginNav.visibleViewController;
            
            rootvc = [rootvc initWithLeftViewController:leftVC centerViewController:nextvc];
            
            [(UINavigationController*)nav pushViewController:rootvc animated:YES];

            loginNav.navigationItem.title = @"球队详情";

        }
            break;
            
        case Module_Tounament:
        {
            
            DicGameinfo *info = (DicGameinfo*)data;

            HLNavgationController *  loginNav =  [[UIStoryboard storyboardWithName:@"Game" bundle:nil] instantiateViewControllerWithIdentifier:@"game"];
            
            GameLeftVC *leftVC = [[GameLeftVC alloc] init];
            
            TounamentVC *  nextvc =  [[UIStoryboard storyboardWithName:@"Game" bundle:nil] instantiateViewControllerWithIdentifier:@"tounamentvc"];
            
            nextvc.num_gameid = info.id;
            
            TounamentBaseVC * rootvc = (TounamentBaseVC*)loginNav.visibleViewController;
            
            rootvc = [rootvc initWithLeftViewController:leftVC centerViewController:nextvc];
            
            [(UINavigationController*)nav pushViewController:rootvc animated:YES];

            loginNav.navigationItem.title = @"赛事详情";

        }
            break;
        case Module_Match:
        {
            
        }
            break;
            
        case Module_User:
        {
            
        }
            break;
            
        case Module_Search:
        {
            
        }
            break;
            
        case Module_Wiki:
        {
            
        }
            break;
            
        default:
            break;
    }
    
}


@end
