//
//  WikiViewModel.m
//  CikersApp
//
//  Created by fxm on 15/12/23.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "WikiViewModel.h"
#import "WikiTableCell.h"
#import "MJRefresh.h"
@implementation WikiViewModel

-(void)initData
{

    self.api = [[Api alloc] initWithDelegate:self needCommonProcess:NO];
    
//    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
//    
//    self.tableView.footerPullToRefreshText = @"上拉可以加载更多数据了";
//    
//    self.tableView.footerReleaseToRefreshText = @"松开马上加载更多数据了";
//    
//    self.tableView.footerRefreshingText = @"MJ哥正在帮你加载中,不客气";

    
    [APSProgress showIndicatorView];
    
    [self.api wiki_listbygame:@"513" limit:@""];
    
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WikiTableCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    NSDictionary *dic  = [self.dataSource objectAtIndex:indexPath.row];
    
    [cell updataContent:dic];
    
    
    return cell;

}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{

    [APSProgress hidenIndicatorView];
    
    NSDictionary * resultDic = [NSJSONSerialization JSONObjectWithData:response.responseData options:NSJSONReadingAllowFragments error:&error];

    NSLog(@"%@",resultDic);
    
    
    // parse
    
    
    NSArray *array = [resultDic objectForKey:@"data"];
    
    
    [self.dataSource removeAllObjects];
    [self.dataSource addObjectsFromArray:array];
    [self.tableView reloadData];
    
    
}

-(void)refreshData
{

}

@end
