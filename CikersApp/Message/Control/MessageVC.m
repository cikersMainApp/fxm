//
//  MessageVC.m
//  CikersApp
//
//  Created by fxm on 15/12/24.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "MessageVC.h"
#import "MatchVC.h"
#import "MessageInfoTBVC.h"

@interface MessageVC()

@property(nonatomic,strong)NSArray *array_data;

- (IBAction)customHeader:(id)sender;

@end


@implementation MessageVC






- (IBAction)customHeader:(id)sender
{
    
    MatchVC *nextvc = [[UIStoryboard storyboardWithName:@"Match" bundle:nil] instantiateViewControllerWithIdentifier:@"match"];
    
    [self presentViewController:nextvc animated:YES completion:nil];
    
//    MatchVC *customHeader = [[MatchVC alloc] init];
    
//    [self.navigationController pushViewController:customHeader animated:YES];


}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString  *CellIdentiferId = @"cell";
    
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentiferId];
  
    //添加向右箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return [self updateUI:cell index:indexPath.row];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row == 3)
    {
        MatchVC *nextvc = [[UIStoryboard storyboardWithName:@"Match" bundle:nil] instantiateViewControllerWithIdentifier:@"match"];
        
        [self presentViewController:nextvc animated:YES completion:nil];

        
        return;
    }
    
    MessageInfoTBVC *nextvc = [[UIStoryboard storyboardWithName:@"Message" bundle:nil] instantiateViewControllerWithIdentifier:@"messageinfotavc"];
    
    [self.navigationController pushViewController:nextvc animated:YES];
    
}

-(UITableViewCell*)updateUI:(UITableViewCell *)cell index:(NSInteger)index
{

    
    cell.imageView.image = [UIImage imageNamed:[self.array_data objectAtIndex:index+4]];
    cell.textLabel.text = [self.array_data objectAtIndex:index];
    cell.detailTextLabel.text = @"您有10个新消息";
    [cell.detailTextLabel setTextColor:[UIColor redColor]];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.array_data = [NSArray arrayWithObjects:@"互动提醒",@"活动相关",@"比赛相关",@"系统提醒",@"bnt_info",@"bnt_match",@"bnt_rankbyplayer",@"bnt_team", nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
