//
//  MyTeamList.m
//  CikersApp
//
//  Created by fxm on 16/2/29.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MyTeamList.h"
#import "NSUserDefaults+RMSaveCustomObject.h"
#import "DicTeaminfo.h"
#import "MyTeamCell.h"
#import "JCAlertView.h"
@interface MyTeamList ()

@end

@implementation MyTeamList

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"我的球队";
 
    _data_obj = [[NSMutableArray alloc] init];
    
    _data_userinfo = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:@"user"];
    
    _operation = [[UserinfoModel alloc] initWithDelegate:nil needCommonProcess:NO];
    _operation.delegate = self;
    [_operation sendTeamByid:_data_userinfo.entityId];
    
    _num_selectTag = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)data_scuess:(id)obj
{
    [_data_obj addObjectsFromArray:(NSArray*)obj];
    [self.tableView reloadData];
}

-(void)data_delScuess:(id)obj
{
    [_data_obj removeObjectAtIndex:_num_selectTag];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELL_NORMAL_HEIGHT;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_data_obj count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[MyTeamCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        tableView.separatorInset = UIEdgeInsetsMake(CELL_NORMAL_HEIGHT-2, 0, 1, 0);
    }
    
    
    cell.backgroundColor = COLOR_GRAY;
    
    if (indexPath.row%2 == 0) {
        
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    DicTeaminfo *info = [_data_obj objectAtIndex:indexPath.row];
    
    cell.textLabel.text = info.name;
    
    NSString *urlstr = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,info.icon];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:urlstr] placeholderImage:PLACEHOLDER_IMG completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        
        
    }];
    
    
    _num_selectTag = indexPath.row;
    
    [cell setClickBlock:^(NSInteger tag) {
        

        [JCAlertView showTwoButtonsWithTitle:@""
                                     Message:@"确定退出吗"
                                  ButtonType:JCAlertViewButtonTypeCancel
                                 ButtonTitle:@"取消"
                                       Click:nil
                                  ButtonType:JCAlertViewButtonTypeDefault
                                 ButtonTitle:@"确定"
                                       Click:^{
                                           [_operation sendTeamRemoveByTeamid:info.id];
            
        }
         
         ];
        
        
    }];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DicTeaminfo *info = [_data_obj objectAtIndex:indexPath.row];
    [SingleManageVC pushOtherModuleByNav:self.navigationController nextNav:nil type:Module_Team data:info];
}



@end
