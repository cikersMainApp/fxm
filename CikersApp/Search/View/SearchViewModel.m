//
//  SearchViewModel.m
//  CikersApp
//
//  Created by fxm on 15/12/22.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "SearchViewModel.h"
#import "SearchTableCell.h"



@implementation SearchViewModel

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.tempTableView = tableView;
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString  *CellIdentiferId = @"cell";
    
    SearchTableCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentiferId];
 
    NSDictionary *dic  = [self.dataSource objectAtIndex:indexPath.row];
    
    [cell updataContent:dic type:0];
    
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma  mark - HLTableView  touch delegate
- (void) touchTable
{
    //    for (HLCommonUsedCell * cell in self.tempTableView.visibleCells) {
    //        [cell touchMe];
    //    }
}

#pragma  mark - HLCommonUseCell delegate & datasource
- (BOOL) canPan
{
    //    for (RecentUse * merchants in self.dataSource) {
    //        if (merchants.isEditing) {
    //            [self touchTable];
    //            merchants.isEditing = NO;
    //            return NO;
    //        }
    //    }
    return YES;
}

- (void) panAnimateBegin
{
    self.tempTableView.scrollEnabled = NO;
}

- (void) panAnimateEnd
{
    self.tempTableView.scrollEnabled = YES;
}

@end
