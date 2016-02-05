//
//  WikiInfoMessage.m
//  CikersApp
//
//  Created by fxm on 16/1/28.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiInfoMessage.h"
#import "WikiInfoCellMessage.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
@interface WikiInfoMessage ()

@end

@implementation WikiInfoMessage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"帖子正文";
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(barShare)];
    
    self.navigationItem.rightBarButtonItem = item;
}

-(void)barShare
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)creatRowOne:(UITableViewCell*)cell
{

    return cell;
}
-(UITableViewCell*)creatRowTwo:(UITableViewCell*)cell
{
    return cell;
}
-(UITableViewCell*)creatRowThree:(UITableViewCell *)cell
{
    return cell;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger num = 1;
    
    num = (section == 1)?10:num;
    
    return num;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSInteger num = CELL_NORMAL_HEIGHT;
    
    switch (indexPath.section) {
        case 0:
        {
            Class mClass =  NSClassFromString(@"WikiInfoCellMessage");
            
            // 返回计算出的cell高度（普通简化版方法，同样只需一步设置即可完成）
            return [self.tableView cellHeightForIndexPath:indexPath model:_data_obj_wiki keyPath:@"data_obj_wiki" cellClass:mClass contentViewWidth:[self cellContentViewWith]];
        }
            break;
        case 1:
        {
        
        }
            break;
        default:
            break;
    }
    
    return num;
}

- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell;

    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"wikicell"];
        
        if (!cell) {
            cell = [[WikiInfoCellMessage alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"wikicell"];
        }
        
        ((WikiInfoCellMessage*)cell).data_obj_wiki = _data_obj_wiki;
        
        
        return (WikiInfoCellMessage*)cell;
    }

    if (indexPath.section == 1 && indexPath.row == 0) {

        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        
        cell.backgroundColor = [UIColor blackColor];
        
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"elemcell"];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"elemcell"];
        }

    }
    
    
    
    return cell;
}

@end
