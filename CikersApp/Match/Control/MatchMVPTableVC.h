//
//  MatchMVPTableVC.h
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARSegmentPageController.h"
#import "MatchOpration.h"
@interface MatchMVPTableVC : UITableViewController<ARSegmentControllerDelegate,MatchOprationDelegate>

@property(nonatomic,strong)MatchOpration *opration;
@property(nonatomic,strong)DicMatchinfo *dic_data;
@property(nonatomic,strong)NSMutableArray *array_team;
@property(nonatomic,strong)NSMutableArray *array_teamA;
@property(nonatomic,strong)NSMutableArray *array_teamB;

@property(nonatomic,assign)NSInteger int_length;

@end
