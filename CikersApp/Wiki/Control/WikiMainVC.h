//
//  WikiMainVC.h
//  CikersApp
//
//  Created by fxm on 15/12/23.
//  Copyright © 2015年 cikers. All rights reserved.
//
/*
 
                WikiMainVC(segmented、property--viewmodel、property--datamodel)
    WikiModel(HTTP)     WikiViewModel(tableview delegate)       WikiListTabview
 
 
 
 */

#import "HLBaseViewController.h"
#import "WikiViewModel.h"
#import "WikiListTabview.h"
#import "FollowVC.h"

@class VOSegmentedControl;

@interface WikiMainVC : HLBaseViewController


@property(nonatomic,strong)WikiViewModel *wikiModel;
@property(nonatomic,strong)WikiListTabview *table_list;
@property(nonatomic,strong)FollowVC *view_follow;


@property (strong, nonatomic)UIView *view_content;
@property(nonatomic,strong)UISegmentedControl *seg_topbnt;





-(void)segment_action:(VOSegmentedControl*)sender;

@end
