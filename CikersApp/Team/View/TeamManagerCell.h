//
//  TeamManagerCell.h
//  CikersApp
//
//  Created by fxm on 15/12/22.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamManagerCell : UITableViewCell

@property(nonatomic,strong) UILabel *lb_name;
@property(nonatomic,strong) UIImageView *img_icon;
@property(nonatomic,strong)UIButton *bt_manager;
@property(nonatomic)int index;
@property(nonatomic,weak)IBOutlet UIButton *test;


-(void)initUI:(NSInteger)index;
-(void)updataUI:(NSInteger)index;
-(void)bnt_click:(id)sender;

@end
