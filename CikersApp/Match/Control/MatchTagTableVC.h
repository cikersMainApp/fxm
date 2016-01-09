//
//  MatchTagTableVC.h
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARSegmentPageController.h"
#import "MatchOpration.h"
#import "DicMatchinfo.h"
#import "MatchTagCell.h"
@interface MatchTagTableVC : UITableViewController<ARSegmentControllerDelegate,MatchOprationDelegate,MatchTagCellDelegate>

@property(nonatomic,strong)MatchOpration *opration;
@property(nonatomic,strong)DicMatchinfo *data_obj_matchinfo;
@property(nonatomic,strong)NSMutableArray *array_team;
@property(nonatomic,strong)NSMutableArray *array_teamA;
@property(nonatomic,strong)NSMutableArray *array_teamB;

@property(nonatomic,strong)NSString *str_teamA;
@property(nonatomic,strong)NSString *str_teamB;


-(void)getData:(NSString*)matchid;



@end
