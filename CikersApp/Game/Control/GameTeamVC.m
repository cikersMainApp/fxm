//
//  GameTeamVC.m
//  CikersApp
//
//  Created by fxm on 16/1/13.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "GameTeamVC.h"
#import "DicTeaminfo.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "GameTeamCell.h"
#import "CreatTeam.h"
#import "HLNavgationController.h"
#import "GameSingUpVC.h"
@interface GameTeamVC ()

@end

@implementation GameTeamVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    self.array_total = [[NSMutableArray alloc] init];
    
    self.navigationItem.title = [NSString stringWithFormat:@"参赛球队(%@)",self.data_obj_info.teamcount];
    
    UIBarButtonItem * bar_right = [[UIBarButtonItem alloc] initWithTitle:@"新建" style:UIBarButtonItemStylePlain target:self action:@selector(bar_action:)];
    
    self.navigationItem.rightBarButtonItem = bar_right;
    
    self.opration = [[GameModel alloc] init];
    self.opration.delegate = self;
    
    
    
    
    [self.opration sendListTeamByGameId:self.num_gameid];
    
}
-(void)bar_action:(id)sender
{

    HLNavgationController *nextvc = [[UIStoryboard storyboardWithName:@"TeamCreat" bundle:nil] instantiateViewControllerWithIdentifier:@"teamcreat"];
    
    [self showViewController:nextvc sender:nil];
    
}
-(void)dataListTeam_scuess:(NSMutableArray *)data
{
    [self.array_total setArray:data];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [self.array_total count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GameTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[GameTeamCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    DicTeaminfo *info = [self.array_total objectAtIndex:indexPath.row];
    
    cell.textLabel.text = info.name;
    
    NSString *urlstr = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,info.icon];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:urlstr] placeholderImage:[UIImage imageNamed:@"img_noneTouxiang"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        
        
    }];
    
 
    [cell setClickBlock:^(NSInteger tag) {
        
        
        GameSingUpVC *nextvc = [[GameSingUpVC alloc] init];
        nextvc.data_team_info = [self.array_total objectAtIndex:tag];
        [self.navigationController pushViewController:nextvc animated:YES];
        
    }];
    
    
    return cell;
}


@end
