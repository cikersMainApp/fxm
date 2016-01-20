//
//  TounamentVC.h
//  CikersApp
//
//  Created by fxm on 16/1/18.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
#import "GameMainContent.h"
#import "GameModel.h"
#import "DicGameinfo.h"
#import "TounamentView.h"
@interface TounamentVC : UIViewController<ICSDrawerControllerChild,ICSDrawerControllerPresenting,GameModelDelegate>
@property(nonatomic,strong)GameModel *opration;
@property(nonatomic,strong)NSMutableArray *array_wikidata;
@property(nonatomic,strong)DicGameinfo *data_obj_info;
@property(nonatomic,strong)NSNumber *num_gameid;
@property(nonatomic,strong)TounamentView *view_bg;
@property(nonatomic,strong)UICollectionView *collect;
@property(nonatomic,weak)ICSDrawerController *drawer;


-(IBAction)bnt_moreTags:(id)sender;
-(void)bnt_item_click:(NSInteger)clicktag;
-(void)bnt_share;
-(void)bnt_manager;
@end
