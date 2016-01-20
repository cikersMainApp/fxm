//
//  TounamentVC.m
//  CikersApp
//
//  Created by fxm on 16/1/18.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "TounamentVC.h"
#import "GameTeamVC.h"
#import "GameInfoVC.h"
#import "GamelistTableVC.h"
#import "GameSingUpVC.h"
#import "BaseNavigationBar.h"
@interface TounamentVC ()

@end

@implementation TounamentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _view_bg = (TounamentView*)self.view;

    __typeof (self) __weak weakself = self;
    

    [_view_bg setClickBlock:^(NSInteger tag) {
       
        [weakself bnt_item_click:tag];
    }];
    
    [_view_bg setClickSingupBlock:^(id sender) {
     

        GameSingUpVC *nextvc = [[GameSingUpVC alloc] init];
//        nextvc.data_team_info = [self.array_total objectAtIndex:tag];
        [weakself.navigationController pushViewController:nextvc animated:YES];

    }];
    

    
//    [self.navigationController.navigationBar customNavigationBar];


    self.array_wikidata = [[NSMutableArray alloc] init];
    self.opration = [[GameModel alloc] init];
    self.opration.delegate = self;
    [self.opration sendInfoBygameid:self.num_gameid];

    [self.opration sendTagsByGameId:self.num_gameid];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dataInfo_scuess:(DicGameinfo *)info
{
    self.data_obj_info = info;
    
    [_view_bg updateUI:info];
}

-(void)dataTagsList_scuess:(id)dic
{

    [_view_bg updateTagsUI:dic];
    
}


-(IBAction)bnt_moreTags:(id)sender
{

}




//{"全部球队","比赛赛程","详细资料","活动动态","联赛排名","球员榜单"}
char * storyName[] = {"gameteamvc","gamelisttablevc","gameinfovc","","gamerankvc","gameplayervc"};

-(void)bnt_item_click:(NSInteger)clicktag
{
    
    
    if (clicktag == 3) {
        
        
        
        return;
    }
    
    id nextvc = [[UIStoryboard storyboardWithName:@"Game" bundle:nil]
                 instantiateViewControllerWithIdentifier:[NSString stringWithUTF8String:storyName[clicktag]]];
    
    switch (clicktag) {
        case 0:
        {
            ((GameTeamVC*)nextvc).num_gameid = self.data_obj_info.id;
            ((GameTeamVC*)nextvc).data_obj_info = self.data_obj_info;
        }
            break;
        case 1  :
        {
            ((GamelistTableVC*)nextvc).num_gameid = self.data_obj_info.id;
        }
            break;
        case 2:
        {
            ((GameInfoVC*)nextvc).data_obj_info = self.data_obj_info;
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;

        default:
            break;
    }
    
    
    [self showViewController:nextvc sender:nil];
    
    
//    [self.navigationController pushViewController:nextvc animated:YES];
    
}

#pragma mark ----------------view’s layout behavior--------------------
- (BOOL)prefersStatusBarHidden{
    return NO;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark ----------------ICSDrawerControllerPresenting--------------------
- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController{
    self.view.userInteractionEnabled = YES;
}

@end
