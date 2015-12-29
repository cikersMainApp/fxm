//
//  WikiTableCell.h
//  CikersApp
//
//  Created by fxm on 15/12/23.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WikiTableCell : UITableViewCell
@property(nonatomic,strong)IBOutlet UIImageView *img_icon;
@property(nonatomic,strong)IBOutlet UILabel *lb_name;
@property(nonatomic,strong) UILabel *lb_info;
@property(nonatomic,strong)IBOutlet UIButton *bt_manager;



-(void)initUI;
-(void)updataContent:(NSDictionary*)dic;
-(void)bnt_click:(id)sender;


@end
