//
//  GamelistTableVC.m
//  CikersApp
//
//  Created by fxm on 16/1/8.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "GamelistTableVC.h"
#import "GameModel.h"
#import "DicMatchinfo.h"
#import "RMMapper.h"
#import "NSUserDefaults+RMSaveCustomObject.h"
#import "DicTeaminfo.h"
#import "DicGameinfo.h"
#import "GameListCell.h"
#import "MatchVC.h"
#import "MatchNavigation.h"
@interface GamelistTableVC ()<GameModelDelegate>

@end

@implementation GamelistTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.title = @"赛程";
    
    self.array_data = [[NSMutableArray alloc] init];
    self.array_next_data = [[NSMutableArray alloc] init];
    self.array_pre_data = [[NSMutableArray alloc] init];
    
    
    GameModel *model = [[GameModel alloc] init];
    model.delegate = self;
    
    [model getListByGameId:self.num_gameid];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)data_scuess:(id)dic
{

    NSDictionary *data = [dic objectForKey:@"data"];

    for (NSDictionary *elem_dic in data) {
        
        DicMatchinfo *matchinfo = [RMMapper objectWithClass:[DicMatchinfo class] fromDictionary:elem_dic];
        
        matchinfo.matchid = [elem_dic objectForKey:@"id"];
        
        
        NSDictionary *teama = [elem_dic objectForKey:@"teama"];
        
        DicTeaminfo *dicteama = [RMMapper objectWithClass:[DicTeaminfo class] fromDictionary:teama];
        
        NSDictionary *teamb = [elem_dic objectForKey:@"teamb"];
        
        DicTeaminfo *dicteamb = [RMMapper objectWithClass:[DicTeaminfo class] fromDictionary:teamb];
        
        NSDictionary *game = [elem_dic objectForKey:@"game"];
        
        if (![game isEqual:[NSNull null]]) {
            DicGameinfo *dicgame = [RMMapper objectWithClass:[DicGameinfo class] fromDictionary:game];
            matchinfo.gameinfo = dicgame;

        }
        
        
        matchinfo.teama  = dicteama;
        
        matchinfo.teamb = dicteamb;
        
        //转换时间
        
        matchinfo.formatScheduletime = [ToolUtil tool_utcToNsstring:matchinfo.scheduletime];
 
        //判断比赛是否结束
        
        matchinfo.isWaiting = ([matchinfo.result isEqual:[NSNull null]])?[NSNumber numberWithInt:1]:[NSNumber numberWithInt:0];
        
        //判断比分是否为nil
        
        matchinfo.score = [NSString stringWithFormat:@"%@-%@",matchinfo.scorea,matchinfo.scoreb];
        
        [matchinfo dic_exchangData];
        
        [[NSUserDefaults standardUserDefaults] rm_setCustomObject:matchinfo forKey:[NSString stringWithFormat:@"match%@",matchinfo.matchid]];

        if (![matchinfo.isWaiting boolValue] &&[ToolUtil tool_checktimeIsTomorrow:matchinfo.starttime]) {
            [self.array_next_data addObject:matchinfo];
        }
        else
        {
            [self.array_pre_data addObject:matchinfo];
        }

    }
    
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *str = @"过往比赛";
    
    str = (section == 0)?@"即将开始":str;
    
    return str;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSInteger int_count = 0;
    
    int_count = (section == 0)?[self.array_next_data count]:[self.array_pre_data count];
    
    return int_count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GameListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    switch (indexPath.section) {
        case 0:
        {
            DicMatchinfo *info = (DicMatchinfo*)[self.array_next_data objectAtIndex:indexPath.row];
            
            [cell updateUI:info];
        }
            break;
        case 1:
        {
            DicMatchinfo *info = (DicMatchinfo*)[self.array_pre_data objectAtIndex:indexPath.row];
            
            [cell updateUI:info];
        }
            break;
        default:
            break;
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MatchNavigation *  nav =  [[UIStoryboard storyboardWithName:@"Match" bundle:nil] instantiateViewControllerWithIdentifier:@"match"];

    MatchVC *nextvc = (MatchVC*)[nav.viewControllers firstObject];
    nextvc.data_dic_matchinfo = [[DicMatchinfo alloc] init];
    
    
    switch (indexPath.section) {
        case 0:
        {
            nextvc.data_dic_matchinfo = (DicMatchinfo*)[self.array_next_data objectAtIndex:indexPath.row];
        }
            break;
        case 1:
        {
            nextvc.data_dic_matchinfo = (DicMatchinfo*)[self.array_pre_data objectAtIndex:indexPath.row];
        }
            break;
        default:
            break;
    }
    
    [self presentViewController:nav animated:YES completion:nil];
}

@end
