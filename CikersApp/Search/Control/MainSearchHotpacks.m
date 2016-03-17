//
//  MainSearch.m
//  CikersApp
//
//  Created by fxm on 16/1/21.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MainSearchHotpacks.h"
#import "MainHotpackscell.h"
#import "MJRefresh.h"
#import "SearchPlayer.h"
#import "SearchTeam.h"
#import "SearchTounament.h"


#define Cell_height 40

@interface MainSearchHotpacks ()

@end

@implementation MainSearchHotpacks

- (void)viewDidLoad {
    [super viewDidLoad];

    _array_all = [[NSMutableArray alloc] init];
    self.navigationItem.title = @"精彩发现";
    
//    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(initData)];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    _operation = [[SearchOperation alloc] initWithDelegate:nil needCommonProcess:NO];
    _operation.delegate = self;
    [self initData];
    
}

-(void)viewWillAppear:(BOOL)animated
{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData
{
    [_operation sendRecommedResult];
    
}
-(void)dataRecommed_scuess:(NSMutableArray *)dic
{
    [_array_all removeAllObjects];
    
    //games
    //teams
    //players
    
    [_array_all setArray:dic];
    
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_array_all count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *array_temp = [_array_all objectAtIndex:section];
    
    return [array_temp count];
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return Cell_height;
}
const char *RecommedTitle[] = {"热门赛事","风云球队","人气之星"};

-(nullable UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, Cell_height)];
    [view setBackgroundColor:COLOR_GRAY];
    
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 5, Cell_height - 10)];
    line.backgroundColor = [UIColor orangeColor];
    [view addSubview:line];
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 100, Cell_height)];
    lb.text = [NSString stringWithUTF8String:RecommedTitle[section]];
    [view addSubview:lb];
    
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake( ScreenWidth - 100,0,128, Cell_height)];
    [view addSubview:bt];
    [bt setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon_cell_all%ld",section+1]] forState:UIControlStateNormal];
    bt.tag = section;
    [bt addTarget:self action:@selector(bnt_click:) forControlEvents:UIControlEventTouchUpInside];
    return view;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_NORMAL_HEIGHT;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    MainHotpackscell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell =[[MainHotpackscell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

//        tableView.separatorInset = UIEdgeInsetsMake(CELL_NORMAL_HEIGHT - 2, 0, 1, 0);
        
    }
    
    NSArray *obj = [_array_all objectAtIndex:indexPath.section];
    
    id elem_obj = [obj objectAtIndex:indexPath.row];
    
    [cell updateUI:elem_obj type:indexPath.section];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section) {
        case 0:
        {
            NSArray *array = [_array_all objectAtIndex:indexPath.section];
            [SingleManageVC pushOtherModuleByNav:self.navigationController nextNav:nil type:Module_Tounament data:[array objectAtIndex:indexPath.row]];
        }
            break;
        case 1:
        {
            NSArray *array = [_array_all objectAtIndex:indexPath.section];
            [SingleManageVC pushOtherModuleByNav:self.navigationController nextNav:nil type:Module_Team data:[array objectAtIndex:indexPath.row]];

        }
            break;
        case 2:
        {
            NSArray *array = [_array_all objectAtIndex:indexPath.section];
            [SingleManageVC pushOtherModuleByNav:self.navigationController nextNav:nil type:Module_Player data:[array objectAtIndex:indexPath.row]];

        }
            break;
            
        default:
            break;
    }
    
}


const char *searchNextnib[] = {"searchtounament","searchteam","searchplayer"};
-(void)bnt_click:(UIButton*)sender
{

    id obj = [[UIStoryboard storyboardWithName:@"Search" bundle:nil] instantiateViewControllerWithIdentifier:[NSString stringWithUTF8String:searchNextnib[sender.tag]]];
    
    [self.navigationController pushViewController:obj animated:YES];
    
}

@end
