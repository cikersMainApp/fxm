//
//  MatchTagCell.h
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//


@protocol MatchTagCellDelegate <NSObject>

@optional

-(void)data_back:(id)sender;

@end

#import <UIKit/UIKit.h>
#import "DicPlayerinfo.h"
@interface MatchTagCell : UITableViewCell


@property(nonatomic,strong)id<MatchTagCellDelegate>delegate;

@property(nonatomic)NSInteger i_index; // 当前的下表

@property(nonatomic,weak)IBOutlet UIImageView *img_photo;
@property(nonatomic,weak)IBOutlet UILabel *lb_name;
@property(nonatomic,weak)IBOutlet UILabel *lb_tag1; //标签1
@property(nonatomic,weak)IBOutlet UILabel *lb_tag2;
@property(nonatomic,weak)IBOutlet UILabel *lb_tag3;

@property(nonatomic,weak)IBOutlet UIView *view_sectionbg; // 显示标题的背景
@property(nonatomic,weak)IBOutlet UILabel *lb_sectionTitle;

@property(nonatomic,strong)UILabel *lb_teamname;


-(IBAction)bnt_action:(UIButton*)sender;


-(void)showSectionState:(BOOL)show bgcolor:(int)color name:(NSString*)name;


-(void)updateUI:(DicPlayerinfo*)dic;

@end
