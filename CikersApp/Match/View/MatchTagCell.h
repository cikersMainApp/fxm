//
//  MatchTagCell.h
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MatchTagCell : UITableViewCell

@property(nonatomic)NSUInteger i_index; // 当前的下表

@property(nonatomic,weak)IBOutlet UIImageView *img_photo;
@property(nonatomic,weak)IBOutlet UILabel *lb_name;
@property(nonatomic,weak)IBOutlet UILabel *lb_tag1; //标签1
@property(nonatomic,weak)IBOutlet UILabel *lb_tag2;
@property(nonatomic,weak)IBOutlet UILabel *lb_tag3;

@property(nonatomic,weak)IBOutlet UIView *view_sectionbg; // 显示标题的背景
@property(nonatomic,weak)IBOutlet UILabel *lb_sectionTitle;

-(IBAction)bnt_action:(UIButton*)sender;


-(void)showSectionState:(BOOL)show bgcolor:(int)color;


-(void)updateUI:(NSDictionary*)dic;

@end
