//
//  WikiMainVC.h
//  CikersApp
//
//  Created by fxm on 15/12/23.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "HLBaseViewController.h"
#import "WikiViewModel.h"
#import "WikiListTabview.h"
#import "FollowVC.h"
@interface WikiMainVC : HLBaseViewController


@property(nonatomic,strong)WikiViewModel *wikiModel;
@property(nonatomic,strong)UITableView *table_list;
@property(nonatomic,strong)FollowVC *view_follow;


@property (strong, nonatomic)UIView *view_content;
@property(nonatomic,strong)UISegmentedControl *seg_topbnt;


-(void)segment_action:(UISegmentedControl*)sender;

@end
