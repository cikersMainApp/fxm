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
    
    self.array_data = [[NSMutableArray alloc] init];
    
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

        [self.array_data addObject:matchinfo];
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
    NSString *str = @"即将开始";
    
    str = (section == 0)?@"过往比赛":str;
    
    return str;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.array_data count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GameListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    DicMatchinfo *info = (DicMatchinfo*)[self.array_data objectAtIndex:indexPath.row];
    
    [cell updateUI:info];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

//    MatchVC *nextvc = [[UIStoryboard storyboardWithName:@"Match" bundle:nil] instantiateViewControllerWithIdentifier:@"matchvc"];
//    nextvc.data_dic_matchinfo = [[DicMatchinfo alloc] init];
//    nextvc.data_dic_matchinfo = (DicMatchinfo*)[self.array_data objectAtIndex:indexPath.row];
//    
    
    MatchNavigation *  nav =  [[UIStoryboard storyboardWithName:@"Match" bundle:nil] instantiateViewControllerWithIdentifier:@"match"];

    MatchVC *nextvc = (MatchVC*)[nav.viewControllers firstObject];
    nextvc.data_dic_matchinfo = [[DicMatchinfo alloc] init];
    nextvc.data_dic_matchinfo = (DicMatchinfo*)[self.array_data objectAtIndex:indexPath.row];
    

    
    
//    [self.navigationController pushViewController:nextvc animated:YES];
    [self presentViewController:nav animated:YES completion:nil];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
