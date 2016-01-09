//
//  MatchTagInfoVC.h
//  CikersApp
//
//  Created by fxm on 16/1/3.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicPlayerinfo.h"

@interface MatchTagInfoVC : HLBaseViewController<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,strong)DicPlayerinfo *dic_player;
@property(nonatomic,strong)UITextField *tf_tag;

-(void)bnt_action:(id)sender;

@end
