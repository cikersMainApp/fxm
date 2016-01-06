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
@interface PredictionVC : UITableViewController<ARSegmentControllerDelegate,MatchOprationDelegate,PredictionCellDelegate>


@property(nonatomic,strong)NSString *str_matchiid;

@property(nonatomic,strong)MatchOpration *opration;

@property(nonatomic,strong)NSDictionary *net_dic;

-(void)getData:(NSString*)matchid;

@end
