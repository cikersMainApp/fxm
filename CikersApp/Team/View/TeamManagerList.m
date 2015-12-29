//
//  TeamManagerList.m
//  CikersApp
//
//  Created by fxm on 15/12/22.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "TeamManagerList.h"
#import "TeamManagerCell.h"
#import "CreatTeam.h"
@implementation TeamManagerList

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(IBAction)bnt_back
{
    [self setFrame:CGRectMake(-400, 0, self.frame.size.width, self.frame.size.height)];
}
-(IBAction)bnt_creatTeam
{
    CreatTeam *nextvc = [[UIStoryboard storyboardWithName:@"TeamCreat" bundle:nil] instantiateViewControllerWithIdentifier:@"teamcreat"];

    [[DataSingleton Instance].curVC showViewController:nextvc sender:nil];
    
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.tempTableView = tableView;
    return 94.f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString  *CellIdentiferId = @"cell";
    TeamManagerCell  *cell = [self.tempTableView dequeueReusableCellWithIdentifier:CellIdentiferId];

    [cell updataUI:indexPath.row];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
@end
