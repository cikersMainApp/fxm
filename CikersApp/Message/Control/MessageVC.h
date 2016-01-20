//
//  MessageVC.h
//  CikersApp
//
//  Created by fxm on 15/12/24.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MessageVC :UITableViewController


@property(nonatomic,strong)NSString *str_updateCount;  //更新数量
@property(nonatomic,assign)NSInteger num_selectTag;

-(UITableViewCell*)updateUI:(UITableViewCell*)cell index:(NSInteger)index;

@end
