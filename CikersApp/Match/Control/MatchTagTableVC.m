//
//  MatchTagTableVC.m
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "MatchTagTableVC.h"
#import "MatchTagCell.h"
#import "MatchTagInfoVC.h"
#import "DicTeaminfo.h"
@interface MatchTagTableVC ()

@end

@implementation MatchTagTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    self.array_teamA = [[NSMutableArray alloc] init];
    self.array_teamB = [[NSMutableArray alloc] init];
    self.array_team = [[NSMutableArray alloc] init];
    
    self.opration = [[MatchOpration alloc] init];
    self.opration.delegate = self;
    [self.opration getPlayersInfoByteamid:self.data_obj_matchinfo.teama.id matchid:self.data_obj_matchinfo.matchid httpTag:@"A" tags:@"1" mvp:@"0"];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    
}

-(void)viewWillAppear:(BOOL)animated
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getData:(NSString *)matchid
{    

}

-(void)data_back:(id)sender
{

    NSNumber *num = (NSNumber*)sender;
    
    MatchTagInfoVC *nextvc = [[MatchTagInfoVC alloc] init];
    
    int tag = 1;
    
    if ([num intValue] >= [self.array_teamA count])
    {
        tag = 2;
    }
    
    nextvc.dic_player = [self.array_team objectAtIndex:[num intValue] - tag];

    [self ];
    
    
}
/*
 传过来的是一个字典
 里面有两个数组，分别代表A队和B对
 */

-(void)dataTag_scuess:(id)dic
{

    NSMutableDictionary *dic_temp = (NSMutableDictionary*)dic;
    
    if ([dic_temp count] == 2) {
        
        self.str_teamA = self.data_obj_matchinfo.teama.name;
        self.str_teamB = self.data_obj_matchinfo.teamb.name;
        
        
        
        self.array_teamA = [dic_temp objectForKey:@"A"];
        self.array_teamB = [dic_temp objectForKey:@"B"];
        [self.array_team addObjectsFromArray:self.array_teamA];
        [self.array_team addObjectsFromArray:self.array_teamB];
        
        [self.tableView reloadData];
    }
    else
    {
        [self.opration getPlayersInfoByteamid:self.data_obj_matchinfo.teamb.id matchid:self.data_obj_matchinfo.matchid httpTag:@"B" tags:@"1" mvp:@"0"];
    }
    
}


#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == [self.array_teamA count]) {
        
        return 30;
    }
    
    return 90.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.array_team count]+2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MatchTagCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    if ([self.array_team count] == 0)
    {
        return cell;
    }
    
    if (indexPath.row == 0 ) {
    
        [cell showSectionState:YES bgcolor:1 name:self.str_teamA];
        
        return cell;
    }
    
    if (indexPath.row == [self.array_teamA count]) {
        
        [cell showSectionState:YES bgcolor:1 name:self.str_teamB];
        
        return cell;
    }
    int tag = 1;
    
    if (indexPath.row >= [self.array_teamA count])
    {
        tag = 2;
    }
    
    cell.i_index = indexPath.row;
    
    [cell showSectionState:NO bgcolor:1 name:@""];
    
        
    [cell updateUI:[self.array_team objectAtIndex:indexPath.row -tag]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MatchTagInfoVC *nextvc = [[MatchTagInfoVC alloc] init];
    
    int tag = 1;
    
    if (indexPath.row >= [self.array_teamA count])
    {
        tag = 2;
    }

    nextvc.dic_player = [self.array_team objectAtIndex:indexPath.row - tag];
    
    [self.navigationController pushViewController:nextvc animated:YES];
}

-(NSString *)segmentTitle
{
    return @"贴标签";
}

-(UIScrollView *)streachScrollView
{
    return self.tableView;
}

@end
