//
//  WikiListTabview.m
//  CikersApp
//
//  Created by fxm on 16/1/1.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiListTabview.h"
@implementation WikiListTabview

/*
//高度
 
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 80;
}

//数量

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

//cell

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (self.cellTypeNews) {
        
        cell = [self updataCellByNews:cell];

        
        cell.textLabel.text = @"简报";
    }
    else
    {
        cell = [self updataCellByAll:cell];
        
        cell.textLabel.text = @"全新闻";
    }
    
    
    
    
    
    return cell;

}
 */

-(WikiNewsCell*)updataCellByNews:(UITableViewCell *)cell
{
    
    WikiNewsCell *ncell = (WikiNewsCell*)cell;

    if (!ncell) {
        
        ncell = [[WikiNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    return ncell;
}

-(WikiAllCell*)updataCellByAll:(UITableViewCell *)cell
{

    WikiAllCell *ncell = (WikiAllCell*)cell;
    
    if (!ncell) {
        
        ncell = [[WikiAllCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    

    return ncell;
}

/*
//selected

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
*/

@end
