//
//  GameVC.h
//  CikersApp
//
//  Created by fxm on 15/12/31.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "HLBaseViewController.h"
#import "ICSDrawerController.h"
#import "GameMainContent.h"
@interface GameVC : HLBaseViewController<ICSDrawerControllerChild,ICSDrawerControllerPresenting>

@property(nonatomic,weak)ICSDrawerController *drawer;
@property(nonatomic,weak)IBOutlet GameMainContent *view_scrollow;


-(IBAction)bnt_manager:(id)sender;

-(IBAction)bnt_back;
-(IBAction)bnt_share;
-(IBAction)bnt_publish;

@end
