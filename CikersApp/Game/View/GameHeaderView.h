//
//  GameHeaderView.h
//  CikersApp
//
//  Created by fxm on 16/1/12.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicGameinfo.h"
@interface GameHeaderView : UIView

@property(nonatomic,strong)DicGameinfo *data_obj_info;
@property(nonatomic,copy)void (^clickBlock)(NSInteger tag);



-(void)initUI;

-(void)initSection1:(UIView*)view;
-(void)initSection2:(UIView*)view;
-(void)initSection3:(UIView*)view;
-(void)bnt_click:(UIButton*)sender;
@end
