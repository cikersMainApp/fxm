//
//  CreatTeamIconVC.h
//  CikersApp
//
//  Created by fxm on 15/12/21.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "HLBaseViewController.h"

@interface CreatTeamIconVC : HLBaseViewController


@property(nonatomic,weak)IBOutlet UIView *view_content;

@property(nonatomic,weak)IBOutlet UIView *view_1;
@property(nonatomic,weak)IBOutlet UIView *view_2;

-(void)initUI;
-(void)bnt_select:(id)sender;

@end
