//
//  MessageInfoTBVC.m
//  CikersApp
//
//  Created by fxm on 16/1/2.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MessageInfoTBVC.h"
#import "MessageVC.h"
#import "MessageCell.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "SingleManageVC.h"
#import "DicPlayerinfo.h"
#import "MyTagsTBView.h"
@interface MessageInfoTBVC ()
{
    MJRefreshComponent *myRefreshView;

}

@end

@implementation MessageInfoTBVC

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    _operation = [[MessageModel alloc] initWithDelegate:nil needCommonProcess:NO];
    _operation.delegate = self;

    _array_infos = [[NSMutableArray alloc] init];
    
    
    MJRefreshGifHeader *mjheader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        
        _num_page = 0;
        
        myRefreshView = self.tableView.mj_header;
        
        [_operation sendBytype:_num_selectCellTag offset:@"0"];
        
    }];
    
    self.tableView.mj_header = mjheader;
    
    [self.tableView.mj_header beginRefreshing];
    
    MJRefreshAutoNormalFooter *mjfooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        _num_page++;
        
        myRefreshView = self.tableView.mj_footer;
        
        [_operation sendBytype:_num_selectCellTag offset:[NSString stringWithFormat:@"%l",_num_page*20]];
    }];
    
    self.tableView.mj_footer = mjfooter;
    
    _num_page = 0;
    

    
    UIBarButtonItem *barRight = [[UIBarButtonItem alloc] initWithTitle:@"清除标记" style:UIBarButtonItemStylePlain target:self action:@selector(clearUpReadStatus)];
    
    self.navigationItem.rightBarButtonItem = barRight;
    
}

-(void)clearUpReadStatus
{

}

-(void)data_scuess:(id)sender
{

    NSMutableArray *temparray = (NSMutableArray*)sender;
    
    if ([temparray count] == 0) {
        
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        [self.tableView.mj_header endRefreshing];
        
        return;
    }
    
    if (myRefreshView == self.tableView.mj_header) {
        _array_infos = temparray;
        [self.tableView.mj_header endRefreshing];

    }
    
    if (myRefreshView == self.tableView.mj_footer) {
        [_array_infos addObjectsFromArray:temparray];
        [self.tableView.mj_footer endRefreshing];

    }
    
    
    
    [self.tableView reloadData];

}

-(void)viewWillDisappear:(BOOL)animated
{
    NSArray *views = self.navigationController.viewControllers;
    
    for (UIViewController *vc in views) {
        
        NSLog(@"%@",[vc restorationClass]);
        
    }
    
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    
    CGRect bar = self.navigationController.navigationBar.frame;
    
    
    NSLog(@"width :%f",rectStatus.size.width);
    NSLog(@"height :%f",rectStatus.size.height);
    NSLog(@"width :%f",bar.size.width);
    NSLog(@"height :%f",bar.size.height);
    
    NSArray *array_temp =self.navigationController.viewControllers;
    
    for (UIViewController *vc in array_temp) {
        if ([vc isKindOfClass:[MessageVC class]])
        {
            ((MessageVC*)vc).str_updateCount = @"";
            ((MessageVC*)vc).num_selectTag = self.num_selectCellTag;
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_NORMAL_HEIGHT;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_array_infos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString  *CellIdentiferId = @"cell";
    
    MessageCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentiferId];
    
    if (!cell) {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentiferId];
    }
    
    DicMessage *dic_msg = [_array_infos objectAtIndex:indexPath.row];
    
    //添加向右箭头

    [cell cellUpdata:dic_msg];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    DicMessage *dic_msg = [_array_infos objectAtIndex:indexPath.row];

    if ([dic_msg.type isEqual:@"memberJoin"] || [dic_msg.type isEqualToString:@"memberLeave"])
    {
    
        DicPlayerinfo *info = [DicPlayerinfo new];
        
        info.name = dic_msg.authorname;
        info.icon = dic_msg.icon;
        info.id = dic_msg.senderId;
        
        [SingleManageVC pushOtherModuleByNav:self.navigationController nextNav:self.navigationController type:Module_Player data:info];
    }
    if ([dic_msg.type isEqualToString:@"tag"]) {
        

        MyTagsTBView *vc_tag = [[MyTagsTBView alloc] init];
        
        //待定
        vc_tag.num_userid = dic_msg.id;
        [vc_tag initOperation:@"player"];
        [self.navigationController pushViewController:vc_tag animated:YES];
        
    }
    
    
}


@end
