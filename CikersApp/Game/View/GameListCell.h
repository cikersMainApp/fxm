//
//  GameListCell.h
//  CikersApp
//
//  Created by fxm on 16/1/8.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameListCell : UITableViewCell

@property(nonatomic,strong)IBOutlet UILabel *lb_time;
@property(nonatomic,strong)IBOutlet UILabel *lb_nameleft;
@property(nonatomic,strong)IBOutlet UILabel *lb_nameright;
@property(nonatomic,strong)IBOutlet UILabel *lb_result;

-(void)updateUI:(id)dic;


@end
