//
//  PublishPersonalList.m
//  CikersApp
//
//  Created by fxm on 16/1/12.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "PublishPersonalList.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "DicSearchinfo.h"
@interface PublishPersonalList ()

@end

@implementation PublishPersonalList

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array_data = [[NSMutableArray alloc] init];
    self.operation = [[PublishModel alloc] initWithDelegate:nil needCommonProcess:NO];
    self.operation.delegate = self;
    self.tableview_.dataSource=self;
    self.tableview_.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.array_data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    DicSearchinfo *info = [self.array_data objectAtIndex:indexPath.row];
    
    NSString *str = [NSString stringWithFormat:@"http://www.cikers.com%@",info.field2];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:str]];
    
    cell.textLabel.text = info.field1;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DicSearchinfo *info = [self.array_data objectAtIndex:indexPath.row];

    NSMutableString *tempStr = [NSMutableString stringWithString:self.preVc.tfview_input.text];
    [tempStr appendFormat:@"@%@",info.field1];
    
    self.preVc.str_selectUser = info.field1;
    
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:info.field1,@"name",info.oid,@"id", nil];
    
    [self.preVc.array_marks addObject:dic];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)bnt_searchResult:(id)sender
{
    [self.operation sendBySearch:self.search_bar.text Searchtype:@"player"];
}

-(void)data_search:(NSMutableArray *)data
{
    [self.array_data setArray:data];
    
    [self.tableview_ reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{

}

@end
