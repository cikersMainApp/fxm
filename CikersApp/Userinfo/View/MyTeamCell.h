//
//  MyTeamCell.h
//  CikersApp
//
//  Created by fxm on 16/3/12.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTeamCell : UITableViewCell

@property(nonatomic,strong)UIButton *bnt_action;
@property(nonatomic,strong)void (^clickBlock)(NSInteger tag);

-(void)updateUI:(NSInteger)tag;
-(void)bnt_click:(UIButton*)sender;

@end
