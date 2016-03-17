//
//  SearchTounament.m
//  CikersApp
//
//  Created by fxm on 16/1/21.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "SearchTounament.h"
#import "MJRefresh.h"
#import "DicGameinfo.h"
#import "SearchTounamentCell.h"
@interface SearchTounament ()

@end

@implementation SearchTounament



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"赛事列表";
    
    _array_data = [[NSMutableArray alloc] init];
    _operation = [[SearchOperation alloc] initWithDelegate:nil needCommonProcess:NO];
    _operation.delegate = self;
    
    self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    
    
    
    _view_searchBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 66)];
    
    _search_bar = [[UISearchBar alloc] initWithFrame:CGRectMake(100, 0, ScreenWidth-100, 66)];
    _search_bar.delegate = self;
    _search_bar.searchResultsButtonSelected = YES;
    _search_bar.showsSearchResultsButton = YES;
    _search_bar.showsBookmarkButton = YES;
    _search_bar.placeholder = @"输入您要寻找的赛事";
    [_view_searchBg addSubview:_search_bar];
    
    _bt_province = [UIButton buttonWithType:UIButtonTypeCustom];
    [_bt_province setBackgroundColor:[UIColor orangeColor]];
    [_bt_province setFrame:CGRectMake(0, 0, 50, 66)];
    [_bt_province setTitle:@"省市" forState:UIControlStateNormal];
    [_bt_province addTarget:self action:@selector(bnt_selectProvince:) forControlEvents:UIControlEventTouchUpInside];
    [_view_searchBg addSubview:_bt_province];
    
    _bt_state = [UIButton buttonWithType:UIButtonTypeCustom];
    [_bt_state setFrame:CGRectMake(50, 0, 50, 66)];
    [_bt_state setTitle:@"状态" forState:UIControlStateNormal];
    [_bt_state addTarget:self action:@selector(bnt_selectState:) forControlEvents:UIControlEventTouchUpInside];
    [_view_searchBg addSubview:_bt_state];
    
    
}

-(void)bnt_selectProvince:(UIButton*)bt
{

}

-(void)bnt_selectState:(UIButton*)bt
{

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
    
    [_operation searchTounamentByOffset:[_array_data count] keyword:_search_bar.text province:@""];
}

-(void)dataTounament_scuess:(id)dic
{
    [self.tableView.mj_footer endRefreshing];
    
    [_array_data addObjectsFromArray:dic];
    
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    [_array_data removeAllObjects];
    
    [_operation searchTounamentByOffset:[_array_data count] keyword:searchBar.text province:@""];
    
    [searchBar resignFirstResponder];
    
}


#pragma mark - Table view data source


-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    if (!_view_searchBg) {
        

        
    }
    
    return _view_searchBg;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_array_data count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 66;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_NORMAL_HEIGHT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SearchTounamentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[SearchTounamentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    }
    
    DicGameinfo *info = [_array_data objectAtIndex:indexPath.row];
    
    [cell updateUI:info];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DicGameinfo *info = [_array_data objectAtIndex:indexPath.row];
    
    [SingleManageVC pushOtherModuleByNav:self.navigationController nextNav:nil type:Module_Tounament data:info];
    
}
@end
