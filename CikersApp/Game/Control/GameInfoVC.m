//
//  GameInfoVC.m
//  CikersApp
//
//  Created by fxm on 16/1/13.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "GameInfoVC.h"
#import "TounamentWebInfo.h"
#import "TounamentInfoCell.h"
#import "UIView+DDExtension.h"
@interface GameInfoVC ()

@end

@implementation GameInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.navigationItem.title = @"赛事资料";
    
    self.array_title = [[NSMutableArray alloc] initWithObjects:@"赛事全称",@"比赛时间",@"比赛地点",@"       赛制",@"  主办方",@"赛事章程",@"赛事简介", nil];

    self.array_info = [[NSMutableArray alloc] init];
    [self.array_info addObject:self.data_obj_info.name];
    [self.array_info addObject:[NSString stringWithFormat:@"%@到%@",self.data_obj_info.starttime,self.data_obj_info.endtime]];
    [self.array_info addObject:self.data_obj_info.province];
    [self.array_info addObject:@""];
    [self.array_info addObject:@""];
    [self.array_info addObject:@"赛事章程"];
    [self.array_info addObject:self.data_obj_info.announce];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return [self.array_title count];

    }
    else
    {
        return 2;

    }
    return [self.array_title count];

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    if (section == 0) {
        return 0;
    }
    
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 1) {
        
        int num_h = 60;
        
        num_h= (indexPath.row == 1)?200:num_h;
        
        return num_h;
    }
    
    return 60;
}


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TounamentInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[TounamentInfoCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cell"];
    }
    
    
    if (indexPath.section == 0)
    {
        cell.textLabel.text = [self.array_title objectAtIndex:indexPath.row];
        
//        [cell setSubjectLabelText:[_array_info objectAtIndex:indexPath.row]];

        cell.detailTextLabel.text = [_array_info objectAtIndex:indexPath.row];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 3, cell.contentView.frame.size.height-10)];
        view.backgroundColor = [UIColor orangeColor];
        [cell.contentView addSubview:view];
        
        cell.textLabel.text = @"比赛地址";
        
        UIButton *_bnt_signUp = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bnt_signUp setBackgroundImage:[UIImage imageNamed:@"icon_bt_map"] forState:UIControlStateNormal];
        _bnt_signUp.frame = CGRectMake(20, 0, 112, 50);
        [_bnt_signUp addTarget:self action:@selector(bnt_map:) forControlEvents:UIControlEventTouchUpInside];
        cell.accessoryView = _bnt_signUp;

        
    }
    if (indexPath.section == 1 && indexPath.row == 2) {
    
        UIImageView *image_map = [[UIImageView alloc] init];
        [image_map setImage:[UIImage imageNamed:@"temp_icon_map"]];
        image_map.coustom_width = 544;
        image_map.coustom_height= 290;
        image_map.coustom_x = 0;
        image_map.coustom_y = 0;
        [cell.contentView addSubview:image_map];
    }

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    if (indexPath.row == 5)
    {
        TounamentWebInfo *nextvc = [[TounamentWebInfo alloc] init];
        
        [self.navigationController pushViewController:nextvc animated:YES];
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        
        
        
        UIActionSheet *mapSelectorSheet = [[UIActionSheet alloc] initWithTitle:@"选择地图" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:nil];
        NSArray *deviceNames = [NSArray arrayWithObjects:@"打开系统自带的地图",@"打开腾讯地图",@"打开百度地图", nil];
        for (NSString *name in deviceNames) {
            [mapSelectorSheet addButtonWithTitle:name];
        }
        [mapSelectorSheet showInView:self.view];

    }
    
}

-(void)bnt_map:(id)sender
{

}

#pragma UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex!=0)// 取消
    {
        double latitude =45.748737;
        double longitude =126.699791;
        
        switch (buttonIndex) {
            case 1:// 打开系统自带的地图
            {
                NSString *string = @"http://maps.apple.com/maps?saddr=39.98,116.31&daddr=41.59,117.40";
                [[UIApplication sharedApplication]  openURL:[NSURL URLWithString:string]];
            }
                break;
            case 2:// 打开腾讯地图
            {
                NSString *stringURL = [NSString stringWithFormat:@"qqmap://map/routeplan?type=drive&&fromcoord=36.547901,104.258354&tocoord=%f,%f&policy=1" ,latitude,longitude];
                NSURL *mapUrl = [NSURL URLWithString:[stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
                
                if ([[UIApplication sharedApplication] canOpenURL:mapUrl])
                {
                    
                    [[UIApplication sharedApplication] openURL:mapUrl];
                }
                else
                {
                    NSLog(@"没安装腾讯地图");
                }
            }
                break;
            case 3:// 打开百度地图
            {
                NSString *stringURL = [NSString stringWithFormat:@"baidumap://map/geocoder?location=%f,%f&coord_type=gcj02&src=" ,latitude,longitude];
                NSURL *mapUrl = [NSURL URLWithString:[stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
                
                if ([[UIApplication sharedApplication] canOpenURL:mapUrl])
                {
                    
                    [[UIApplication sharedApplication] openURL:mapUrl];
                }
                else
                {
                    NSLog(@"没安装百度地图");
                }
            }
                break;
        }
    }
}

@end
