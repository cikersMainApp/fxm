//
//  MatchMVPCell.h
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

@protocol MatchMVPCellDelegate <NSObject>

@optional

-(void)cell_click:(NSNumber*)playerid;

@end


#import <UIKit/UIKit.h>
#import "DicPlayerinfo.h"
@interface MatchMVPCell : UITableViewCell

@property(nonatomic,strong)id<MatchMVPCellDelegate>delegate;
@property(nonatomic,strong)NSNumber *playerid;


@property(nonatomic,weak)IBOutlet UIView *view_bg1;
@property(nonatomic,weak)IBOutlet UIImageView *img_photo1;
@property(nonatomic,weak)IBOutlet UILabel *lb_name1;
@property(nonatomic,weak)IBOutlet UILabel *lb_favorNum1;
@property(nonatomic,weak)IBOutlet UIButton *bt_follow1;
-(IBAction)bnt_action1:(id)sender;

@property(nonatomic,weak)IBOutlet UIView *view_bg2;
@property(nonatomic,weak)IBOutlet UIImageView *img_photo2;
@property(nonatomic,weak)IBOutlet UILabel *lb_name2;
@property(nonatomic,weak)IBOutlet UILabel *lb_favorNum2;
@property(nonatomic,weak)IBOutlet UIButton *bt_follow2;
-(IBAction)bnt_action2:(id)sender;


@property(nonatomic,strong)IBOutlet UIView *view_bg;
@property(nonatomic,strong)IBOutlet UILabel *lb_rank;
@property(nonatomic,strong)IBOutlet UIImageView *img_photo;
@property(nonatomic,strong)IBOutlet UILabel *lb_name;




-(void)initUI;

-(void)updateUI:(DicPlayerinfo*)playera playerb:(DicPlayerinfo*)playerb;
-(void)updateUI:(DicPlayerinfo *)player;





@end
