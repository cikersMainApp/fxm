//
//  MatchTagInfoVC.h
//  CikersApp
//
//  Created by fxm on 16/1/3.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicPlayerinfo.h"
@class MatchTagTableVC;

@interface MatchTagInfoVC : HLBaseViewController<UITableViewDataSource,UITableViewDelegate>



@property(nonatomic,strong)MatchTagTableVC *delegate_match;
@property(nonatomic,strong)DicPlayerinfo *dic_player;
@property(nonatomic,strong)UITextField *tf_tag;
@property(nonatomic,assign)NSInteger num_index;//该球员的下标，用在返回时更新数据


-(void)bnt_action:(id)sender;

@end
