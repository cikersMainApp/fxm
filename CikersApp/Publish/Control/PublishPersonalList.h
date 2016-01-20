//
//  PublishPersonalList.h
//  CikersApp
//
//  Created by fxm on 16/1/12.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "HLBaseViewController.h"
#import "PublishModel.h"
#import "PublishPersonalVC.h"

@interface PublishPersonalList : UIViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,PublishModelDelegate>

@property(nonatomic,strong)PublishPersonalVC *preVc;
@property(nonatomic,strong)PublishModel *operation;
@property(nonatomic,strong)IBOutlet UITableView *tableview_;
@property(nonatomic,strong)IBOutlet UISearchBar *search_bar;
@property(nonatomic,strong)NSMutableArray *array_data;


-(IBAction)bnt_searchResult:(id)sender;




@end
