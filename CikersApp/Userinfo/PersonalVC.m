//
//  PersonalVC.m
//  CikersApp
//
//  Created by fxm on 16/1/2.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "PersonalVC.h"
#import "XBMeHeaderView.h"
#import "XBConst.h"
#import "XBSettingCell.h"
#import "XBSettingItemModel.h"
#import "XBSettingSectionModel.h"
#import "AppDelegate.h"
#import "NSUserDefaults+RMSaveCustomObject.h"
@interface PersonalVC ()
@property (nonatomic,strong) XBMeHeaderView *header;
@property (nonatomic,strong) NSArray  *sectionArray; /**< section模型数组*/

@end

@implementation PersonalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = XBMakeColorWithRGB(234, 234, 234, 1);
//    self.tableView.backgroundColor = [UIColor whiteColor];
//    [self setupSections];
//    
//    XBMeHeaderView *header = [[[NSBundle mainBundle]loadNibNamed:@"XBMeHeaderView" owner:nil options:nil] firstObject];
//    self.header = header;
//    self.tableView.tableHeaderView = header;
    

    _data_obj_info = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:@"user"];
    
    [_view_head updateUI:_data_obj_info];
    
}
- (void)setupSections
{
    
    //************************************section1
    XBSettingItemModel *item1 = [[XBSettingItemModel alloc]init];
    item1.funcName = @"我的标签";
    item1.executeCode = ^{
        NSLog(@"1");
    };
    item1.img = [UIImage imageNamed:@"icon-list01"];
    item1.detailText = @"您有10个未读";
    item1.accessoryType = XBSettingAccessoryTypeDisclosureIndicator;
    
    
    XBSettingItemModel *item2 = [[XBSettingItemModel alloc]init];
    item2.funcName = @"我的球队";
    item2.img = [UIImage imageNamed:@"icon-list01"];
    item2.accessoryType = XBSettingAccessoryTypeDisclosureIndicator;
    
    XBSettingItemModel *item3 = [[XBSettingItemModel alloc]init];
    item3.funcName = @"我的赛事";
    item3.img = [UIImage imageNamed:@"icon-list01"];
    item3.accessoryType = XBSettingAccessoryTypeDisclosureIndicator;
    
    XBSettingItemModel *item4 = [[XBSettingItemModel alloc]init];
    item4.funcName = @"我的关注";
    item4.img = [UIImage imageNamed:@"icon-list01"];
    item4.accessoryType = XBSettingAccessoryTypeDisclosureIndicator;
    
    XBSettingSectionModel *section1 = [[XBSettingSectionModel alloc]init];
    section1.sectionHeaderHeight = 18;
    section1.itemArray = @[item1,item2,item3,item4];
    
    XBSettingItemModel *item5 = [[XBSettingItemModel alloc]init];
    item5.funcName = @"我的活动";
    item5.img = [UIImage imageNamed:@"icon-list01"];
    item5.executeCode = ^{
        NSLog(@"2");
    };
    item5.accessoryType = XBSettingAccessoryTypeDisclosureIndicator;
    
    XBSettingItemModel *item6 = [[XBSettingItemModel alloc]init];
    item6.funcName = @"我的发言";
    item6.img = [UIImage imageNamed:@"icon-list01"];
    item6.executeCode = ^{
        NSLog(@"我的发言");
    };
    item6.accessoryType = XBSettingAccessoryTypeDisclosureIndicator;
    
    XBSettingSectionModel *section2 = [[XBSettingSectionModel alloc]init];
    section2.sectionHeaderHeight = 18;
    section2.itemArray = @[item5,item6];
    
    self.sectionArray = @[section1,section2];
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
@end
