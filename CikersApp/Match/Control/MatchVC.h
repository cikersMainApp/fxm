//
//  MatchVC.h
//  CikersApp
//
//  Created by fxm on 15/12/28.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "ARSegmentPageController.h"
#import "MatchOpration.h"
#import "PredictionVC.h"
#import "MatchMVPTableVC.h"
#import "MatchTagTableVC.h"
#import "MatchWikiVC.h"
@interface MatchVC : ARSegmentPageController<MatchOprationDelegate>

@property(nonatomic,strong)MatchOpration *opration;
@property(nonatomic,strong)NSString *str_score;

@property(nonatomic,strong)PredictionVC *table_predic;
@property(nonatomic,strong)MatchMVPTableVC *table_mvp;
@property(nonatomic,strong)MatchTagTableVC *table_tag;
@property(nonatomic,strong)MatchWikiVC *table_wiki;

-(IBAction)bnt_back:(id)sender;

@end
