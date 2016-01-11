//
//  MatchMVPResultCell.h
//  CikersApp
//
//  Created by fxm on 16/1/10.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicPlayerinfo.h"
@interface MatchMVPResultCell : UITableViewCell


@property(nonatomic,strong)UILabel *lb_rank;
@property(nonatomic,strong)UIImageView *img_photo;
@property(nonatomic,strong)UILabel *lb_name;


-(void)updateUI:(DicPlayerinfo*)player;

@end
