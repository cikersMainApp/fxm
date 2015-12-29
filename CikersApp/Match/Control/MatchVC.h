//
//  MatchVC.h
//  CikersApp
//
//  Created by fxm on 15/12/28.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "ARSegmentPageController.h"
#import "MatchOpration.h"
@interface MatchVC : ARSegmentPageController<MatchOprationDelegate>

@property(nonatomic,strong)MatchOpration *opration;
@property(nonatomic,strong)NSString *str_score;

-(IBAction)bnt_back:(id)sender;

@end
