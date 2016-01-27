//
//  MainSearch.h
//  CikersApp
//
//  Created by fxm on 16/1/21.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchOperation.h"
@interface MainSearchHotpacks : UITableViewController<SearchOperationDelegate>

@property(nonatomic,strong)NSMutableArray *array_all;
@property(nonatomic,strong)SearchOperation *operation;

-(void)initData;

@end
