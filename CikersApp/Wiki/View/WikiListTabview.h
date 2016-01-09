//
//  WikiListTabview.h
//  CikersApp
//
//  Created by fxm on 16/1/1.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "HLTableView.h"
#import "WikiAllCell.h"
#import "WikiNewsCell.h"

@interface WikiListTabview : UITableView

@property(nonatomic,assign)BOOL cellTypeNews;  //true is news only image&text   false is All news


-(WikiAllCell*)updataCellByAll:(UITableViewCell*)cell;

-(WikiNewsCell*)updataCellByNews:(UITableViewCell*)cell;

@end
