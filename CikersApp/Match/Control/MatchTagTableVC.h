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
@interface MatchTagTableVC : UITableViewController<ARSegmentControllerDelegate,MatchOprationDelegate>

@property(nonatomic,strong)MatchOpration *opration;
@property(nonatomic,strong)NSDictionary *dic_data;


-(void)getData:(NSString*)matchid;

@end
