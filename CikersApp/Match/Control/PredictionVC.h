//
//  PredictionVC.h
//  CikersApp
//
//  Created by fxm on 15/12/28.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARSegmentPageController.h"
#import "MatchOpration.h"
#import "PredictionCell.h"
#import "DicMatchinfo.h"
@interface PredictionVC : UITableViewController<ARSegmentControllerDelegate,MatchOprationDelegate,PredictionCellDelegate>


@property(nonatomic,strong)NSNumber *str_matchiid;

@property(nonatomic,strong)MatchOpration *opration;

@property(nonatomic,strong)NSDictionary *net_dic;

@property(nonatomic,strong)NSString *str_predictionTag; //竞猜的下标

@property(nonatomic,strong)DicMatchinfo *data_obj_matchinfo;

@property(nonatomic,strong)PredictionCell *cell_predic;

-(void)getData:(NSNumber*)matchid;

@end
