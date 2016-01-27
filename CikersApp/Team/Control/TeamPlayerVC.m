//
//  TeamPlayerVC.m
//  CikersApp
//
//  Created by fxm on 16/1/22.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "TeamPlayerVC.h"
#import "TeamPlayerCell.h"
@interface TeamPlayerVC ()

@end

@implementation TeamPlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"球队名单";
    
    _array_total = [[NSMutableArray alloc] init];

    
    _opration = [[TeamModel alloc] initWithDelegate:nil needCommonProcess:NO];
    _opration.delegate = self;
    
    [_opration sendPlayer:_num_teamid];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dataPlayer_scuess:(id)dic
{

    [_array_total setArray:(NSArray*)dic];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_array_total count];
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_NORMAL_HEIGHT;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    TeamPlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    [cell updateUI:[_array_total objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [SingleManageVC pushOtherModuleByNav:self.navigationController nextNav:nil type:Module_Player data:[_array_total objectAtIndex:indexPath.row]];
    
}

@end
