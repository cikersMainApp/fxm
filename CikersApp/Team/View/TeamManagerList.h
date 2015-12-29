//
//  TeamManagerList.h
//  CikersApp
//
//  Created by fxm on 15/12/22.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamManagerList : UIView<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,weak)IBOutlet UITableView *tempTableView;

-(IBAction)bnt_back;
-(IBAction)bnt_creatTeam;

@end
