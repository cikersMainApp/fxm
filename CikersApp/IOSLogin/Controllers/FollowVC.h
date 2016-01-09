//
//  FollowVC.h
//  CikersApp
//
//  Created by fxm on 15/12/20.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "HLBaseViewController.h"

@interface FollowVC : HLBaseViewController

@property(nonatomic,strong)IBOutlet UIView *view_bntbg;


-(IBAction)bnt_follow;

-(IBAction)bnt_switch:(UIButton*)sender;
@end
