//
//  SearchViewModel.h
//  CikersApp
//
//  Created by fxm on 15/12/22.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "HLCommonUsedCell.h"
@class SearchVC;
@interface SearchViewModel : NSObject
<UITableViewDataSource,
UITableViewDelegate,
HLTableViewDelegate>
@property (nonatomic,strong) NSMutableArray * dataSource;
@property(nonatomic,weak) id delegate;
@property (nonatomic,strong) UITableView * tempTableView;
@property(nonatomic,strong)SearchVC *vc_search;
@end
