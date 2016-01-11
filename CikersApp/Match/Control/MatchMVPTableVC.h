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
#import "MatchMVPCell.h"
@interface MatchMVPTableVC : UITableViewController<ARSegmentControllerDelegate,MatchOprationDelegate,MatchMVPCellDelegate>

@property(nonatomic,strong)MatchOpration *opration;
@property(nonatomic,strong)DicMatchinfo *dic_data;
@property(nonatomic,strong)NSMutableArray *array_team;
@property(nonatomic,strong)NSMutableArray *array_teamA;
@property(nonatomic,strong)NSMutableArray *array_teamB;
@property(nonatomic,strong)NSMutableArray *array_teamrank;


@property(nonatomic,assign)NSInteger int_length;
@property(nonatomic,assign)BOOL isShowResult;


@end
