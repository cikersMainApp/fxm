//
//  SearchTeam.m
//  CikersApp
//
//  Created by fxm on 16/1/21.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "SearchTeam.h"
#import "MJRefresh.h"
#import "DicTeaminfo.h"
#import "SearchTeamCell.h"


#define Cell_height 66

@interface SearchTeam ()

@end

@implementation SearchTeam

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"球队列表";
    
    _array_data = [[NSMutableArray alloc] init];
    _operation = [[SearchOperation alloc] initWithDelegate:nil needCommonProcess:NO];
    _operation.delegate = self;
    
    self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    
    _view_headerbg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, Cell_height)];
    
    _search_bar = [[UISearchBar alloc] initWithFrame:CGRectMake(ScreenWidth/3, 0, ScreenWidth/3.0f*2, Cell_height)];
    _search_bar.delegate = self;
    _search_bar.searchResultsButtonSelected = YES;
    _search_bar.showsSearchResultsButton = YES;
    _search_bar.showsBookmarkButton = YES;
    _search_bar.placeholder = @"输入您要寻找的球队";
    [_view_headerbg addSubview:_search_bar];
    
    for (UIView *subview in _search_bar.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            [subview removeFromSuperview];
            break;
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)refreshData
{
    
    if ([_array_data count] == 0)
    {
        [self.tableView.mj_footer endRefreshing];
        return;
    }
    
    [_operation searchTeamByOffset:[_array_data count] keyword:_search_bar.text sportscat:0 province:@""];
}

-(void)dataTeam_scuess:(id)dic
{
    [self.tableView.mj_footer endRefreshing];
    
    [_array_data addObjectsFromArray:dic];
    
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    [_array_data removeAllObjects];
    
    [_operation searchTeamByOffset:[_array_data count] keyword:searchBar.text sportscat:0 province:@""];
    
    
    [searchBar resignFirstResponder];
    
}


#pragma mark - Table view data source


-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return _view_headerbg;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_array_data count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return Cell_height;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_NORMAL_HEIGHT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SearchTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[SearchTeamCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    DicTeaminfo *info = [_array_data objectAtIndex:indexPath.row];
    
    [cell updateUI:info];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DicTeaminfo *info = [_array_data objectAtIndex:indexPath.row];
    
    [SingleManageVC pushOtherModuleByNav:self.navigationController nextNav:nil type:Module_Team data:info];
    
}
@end
