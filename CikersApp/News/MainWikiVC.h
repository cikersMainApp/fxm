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
@interface MainWikiVC : UIViewController

@property(nonatomic,strong)WikiCircleTableview *view_circle;
@property(nonatomic,strong)FollowVC *view_follow;
@property(nonatomic,strong)VOSegmentedControl *seg_ment;



-(void)segment_action:(VOSegmentedControl*)sender;

@end
