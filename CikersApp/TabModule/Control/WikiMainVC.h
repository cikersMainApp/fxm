//
//  WikiMainVC.h
//  CikersApp
//
//  Created by fxm on 15/12/23.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "HLBaseViewController.h"
#import "WikiViewModel.h"
@interface WikiMainVC : HLBaseViewController


@property(nonatomic,strong)WikiViewModel *wikiModel;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;


@end
