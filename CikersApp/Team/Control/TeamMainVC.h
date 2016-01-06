//
//  TeamMainVC.h
//  CikersApp
//
//  Created by fxm on 15/12/20.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "HLBaseViewController.h"
#import "TeamManagerList.h"
#import "TeamContentView.h"
#import "ICSDrawerController.h"
@interface TeamMainVC : HLBaseViewController<UITableViewDelegate,UITableViewDataSource,ICSDrawerControllerChild, ICSDrawerControllerPresenting>

//@property(nonatomic,weak)IBOutlet TeamManagerList *view_left;
@property(nonatomic,weak)IBOutlet TeamContentView *view_scrollow;
@property (nonatomic,weak) ICSDrawerController *drawer;

-(IBAction)bnt_back;
-(IBAction)bnt_share;
-(IBAction)bnt_manager;
-(IBAction)bnt_publish;

-(IBAction)bnt_join:(id)sender;
-(IBAction)bnt_creat:(id)sender;


@end
