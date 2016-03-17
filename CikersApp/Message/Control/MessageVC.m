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

@end


@implementation MessageVC


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_NORMAL_HEIGHT;
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
 
    MessageInfoTBVC *nextvc = [[UIStoryboard storyboardWithName:@"Message" bundle:nil] instantiateViewControllerWithIdentifier:@"messageinfotavc"];
    
    nextvc.navigationItem.title = [self.array_data objectAtIndex:indexPath.row];
    
    nextvc.num_selectCellTag = indexPath.row;
    
    [self.navigationController pushViewController:nextvc animated:YES];
    
}

-(UITableViewCell*)updateUI:(UITableViewCell *)cell index:(NSInteger)index
{
    cell.imageView.image = [UIImage imageNamed:[self.array_data objectAtIndex:index+4]];
    cell.textLabel.text = [self.array_data objectAtIndex:index];
    cell.detailTextLabel.text = _str_updateCount;
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.backgroundColor = [UIColor orangeColor];
    cell.detailTextLabel.layer.masksToBounds = YES;
    cell.detailTextLabel.layer.cornerRadius = 10.0f;
    cell.detailTextLabel.layer.borderWidth = 0.0f;
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _array_data = [NSArray arrayWithObjects:@"互动提醒",@"活动相关",@"比赛相关",@"系统提醒",@"bnt_info",@"bnt_match",@"bnt_rankbyplayer",@"bnt_team", nil];
    
    _str_updateCount = @" 10+  ";
    
}

-(void)viewWillAppear:(BOOL)animated
{
    // 局部更新
    
    NSLog(@"animated :%d",animated);
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
