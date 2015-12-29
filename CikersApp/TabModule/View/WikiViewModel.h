//
//  WikiViewModel.h
//  CikersApp
//
//  Created by fxm on 15/12/23.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Api.h"
@interface WikiViewModel : NSObject<UITableViewDelegate,UITableViewDataSource,BaseApiDelegate>
@property (nonatomic,strong) NSMutableArray * dataSource;
@property(nonatomic,weak) id delegate;
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) Api *api;

@property(nonatomic)int curIndex;// 当前的下标


-(void)initData;

-(void)refreshData;

@end
