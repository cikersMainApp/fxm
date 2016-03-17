//
//  PersonalVC.m
//  CikersApp
//
//  Created by fxm on 16/1/2.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "PersonalVC.h"
#import "AppDelegate.h"
#import "NSUserDefaults+RMSaveCustomObject.h"
#import "MySettingTBView.h"


@interface PersonalVC ()

@end

@implementation PersonalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _data_obj_info = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:@"user"];
    
    [_view_head updateUI:_data_obj_info];
    
    UIBarButtonItem *bar_right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon-list01"] style:UIBarButtonItemStylePlain target:self action:@selector(bnt_setting)];
    
    self.navigationItem.rightBarButtonItem = bar_right;
    
}

-(void)bnt_setting
{

    MySettingTBView *  setview =  [[UIStoryboard storyboardWithName:@"Myinfo" bundle:nil] instantiateViewControllerWithIdentifier:@"mysettingtbview"];
    setview.navigationItem.title = @"设置";
    [self.navigationController pushViewController:setview animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    XBSettingSectionModel *sectionModel = self.sectionArray[section];
    return sectionModel.itemArray.count;}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"setting";
    XBSettingSectionModel *sectionModel = self.sectionArray[indexPath.section];
    XBSettingItemModel *itemModel = sectionModel.itemArray[indexPath.row];
    
    XBSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[XBSettingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.item = itemModel;
    return cell;
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    XBSettingSectionModel *sectionModel = self.sectionArray[section];
    return sectionModel.sectionHeaderHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XBSettingSectionModel *sectionModel = self.sectionArray[indexPath.section];
    XBSettingItemModel *itemModel = sectionModel.itemArray[indexPath.row];
    if (itemModel.executeCode) {
        itemModel.executeCode();
    }
    
    [AppDelegate setLoginRoot];
    
}

//uitableview处理section的不悬浮，禁止section停留的方法，主要是这段代码
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    XBSettingSectionModel *sectionModel = [self.sectionArray firstObject];
    CGFloat sectionHeaderHeight = sectionModel.sectionHeaderHeight;
    
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}

@end
