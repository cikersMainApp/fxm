//
//  GameTeamCell.h
//  CikersApp
//
//  Created by fxm on 16/1/15.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameTeamCell : UITableViewCell

@property(nonatomic,strong)UIButton *bnt_signUp;
@property(nonatomic,strong)void (^clickBlock)(NSInteger tag);

-(void)updateUI:(NSInteger)tag;
-(void)bnt_click:(UIButton*)sender;

@end
