//
//  MatchMVPCell.h
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MatchMVPCell : UITableViewCell


@property(nonatomic,weak)IBOutlet UIImageView *img_photo1;
@property(nonatomic,weak)IBOutlet UILabel *lb_name1;
@property(nonatomic,weak)IBOutlet UILabel *lb_favorNum1;
@property(nonatomic,weak)IBOutlet UIButton *bt_follow1;
-(IBAction)bnt_action1:(id)sender;

@property(nonatomic,weak)IBOutlet UIImageView *img_photo2;
@property(nonatomic,weak)IBOutlet UILabel *lb_name2;
@property(nonatomic,weak)IBOutlet UILabel *lb_favorNum2;
@property(nonatomic,weak)IBOutlet UIButton *bt_follow2;
-(IBAction)bnt_action2:(id)sender;



-(void)initUI;





@end
