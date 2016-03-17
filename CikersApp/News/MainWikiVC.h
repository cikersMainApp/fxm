//
//  MainWikiVC.h
//  CikersApp
//
//  Created by fxm on 16/1/27.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VOSegmentedControl.h"
#import "FollowVC.h"
#import "WikiCircleTableview.h"
#import "WikiFollowVC.h"
@interface MainWikiVC : UIViewController

@property(nonatomic,strong)WikiCircleTableview *view_circle;
@property(nonatomic,strong)WikiFollowVC *view_follow;
@property(nonatomic,strong)VOSegmentedControl *seg_ment;

@property(nonatomic,strong)UIScrollView *scrollView;


-(void)segment_action:(VOSegmentedControl*)sender;

@end
