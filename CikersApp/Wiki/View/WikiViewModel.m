//
//  WikiViewModel.m
//  CikersApp
//
//  Created by fxm on 15/12/23.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "WikiViewModel.h"
#import "MJRefresh.h"
#import "RMMapper.h"
#import "WIkiModel.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "DemoVC7Cell.h"
#import "DemoVC7Cell2.h"
#import "WikiAllCell.h"
#import "WikiNewsCell.h"
#import "MatchWikiCell.h"
#import "DicWikiInfo.h"
@implementation WikiViewModel

-(void)initData
{

    self.api = [[Api alloc] initWithDelegate:self needCommonProcess:NO];
    
    self.tableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    
    
    [self.tableView registerClass:[DemoVC7Cell class] forCellReuseIdentifier:NSStringFromClass([DemoVC7Cell class])];
    [self.tableView registerClass:[DemoVC7Cell2 class] forCellReuseIdentifier:NSStringFromClass([DemoVC7Cell2 class])];
    [self.tableView registerClass:[MatchWikiCell class] forCellReuseIdentifier:@"cell"];

    self.tableView.estimatedRowHeight = 100;

    
    self.dataSource = [[NSMutableArray alloc] init];
    
    
    [APSProgress showIndicatorView];
    
    [self.api wiki_listbygame:@"513" limit:@"20"];
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.tableView cellHeightForIndexPath:indexPath cellContentViewWidth:ScreenWidth tableView:self.tableView];

    if (self.cellTypeNews)
    {
        
        Class currentClass = [DemoVC7Cell class];
        
        DicWikiInfo *model = self.dataSource[indexPath.row];
        
        if ([model.contenttype isEqual:Wiki_type_image])
            
        {
            currentClass = [DemoVC7Cell2 class];
        }
        
        return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:currentClass];
    }
    

    
    else
    {
        
        return [self.tableView cellHeightForIndexPath:indexPath cellContentViewWidth:ScreenWidth tableView:self.tableView];
        
    }
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
 if (self.cellTypeNews)
 {
     [self.tableView startAutoCellHeightWithCellClasses:@[[DemoVC7Cell class], [DemoVC7Cell2 class]] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
 }

    
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell;
    
    if (self.cellTypeNews) {
        
        cell = [self updataCellByNews:indexPath.row];
    }
    else
    {
        MatchWikiCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        cell1.model = self.dataSource[indexPath.row];

        cell = cell1;
    }
    
    return cell;
}

-(UITableViewCell*)updataCellByNews:(NSInteger)index
{
    
    Class currentClass = [DemoVC7Cell class];
    
    DemoVC7Cell *cell = nil;
    
    DicWikiInfo *model = self.dataSource[index];
    
    if ([model.contenttype isEqual:Wiki_type_image])
    {
        if (model.image.count > 1) {
            currentClass = [DemoVC7Cell2 class];
        }
    }
    
    
    cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass(currentClass)];
    
    cell.model = model;
    
    
    return cell;
}

-(WikiAllCell*)updataCellByAll:(UITableViewCell *)cell
{
    
    WikiAllCell *ncell = (WikiAllCell*)cell;
    
    if (!ncell) {
        
        ncell = [[WikiAllCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    return ncell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{

    
    NSArray *array = [request.userInfo objectForKey:@"data"];
    
    [self.dataSource removeAllObjects];

    for (NSDictionary *elem_dic in array) {

        DicWikiInfo *model = [RMMapper objectWithClass:[WIkiModel class] fromDictionary:elem_dic];
        
        [model parseExtra];
        
        [self.dataSource addObject:model];

    }
    
    [self.tableView reloadData];
    
    
}

-(void)refreshData
{
    [self.api wiki_listbyteam:@"9294" limit:@"20"];

}

@end
