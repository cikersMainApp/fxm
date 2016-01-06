//
//  MatchWikiVC.h
//  CikersApp
//
//  Created by fxm on 16/1/3.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchOpration.h"
#import "ARSegmentControllerDelegate.h"
#import "MatchWikiCell.h"
@interface MatchWikiVC : UITableViewController<MatchOprationDelegate,ARSegmentControllerDelegate,MatchWikiCellDelegate>

@property(nonatomic,strong)MatchOpration *opration;
@property(nonatomic,strong)NSMutableArray *array_data;
@property(nonatomic,strong)NSString *matchid;
@property(nonatomic,strong)NSMutableArray *array_netdata;

@property(nonatomic,strong)NSMutableArray *array_wikidata;

@property(nonatomic,assign)float _screenWidth;
@end
