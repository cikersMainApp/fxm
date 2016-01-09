//
//  WikiViewModel.h
//  CikersApp
//
//  Created by fxm on 15/12/23.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Api.h"
#import "WikiNewsCell.h"
#import "WikiAllCell.h"
@interface WikiViewModel : NSObject<UITableViewDelegate,UITableViewDataSource,BaseApiDelegate>
@property (nonatomic,strong) NSMutableArray * dataSource;
@property(nonatomic,weak) id delegate;
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) Api *api;

@property(nonatomic)int curIndex;// 当前的下标

@property(nonatomic,assign)BOOL cellTypeNews;  //true is news only image&text   false is All news


-(void)initData;

-(void)refreshData;

-(UITableViewCell*)updataCellByNews:(NSInteger )index;
-(WikiAllCell*)updataCellByAll:(UITableViewCell *)cell;

@end
