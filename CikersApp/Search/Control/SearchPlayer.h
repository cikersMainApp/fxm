//
//  SearchPlayer.h
//  CikersApp
//
//  Created by fxm on 16/1/21.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchOperation.h"
@interface SearchPlayer : UITableViewController<UISearchBarDelegate,SearchOperationDelegate>

@property(nonatomic,strong)NSMutableArray *array_data;
@property(nonatomic,strong)SearchOperation *operation;
@property(nonatomic,strong)UISearchBar *search_bar;


-(void)refreshData;
@end
