//
//  GameListCell.m
//  CikersApp
//
//  Created by fxm on 16/1/8.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "GameListCell.h"
#import "DicMatchinfo.h"
#import "DicTeaminfo.h"
@implementation GameListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)updateUI:(id)dic
{

    DicMatchinfo *info = (DicMatchinfo*)dic;
    
    self.lb_time.text = info.time_scheduletime;

    self.lb_nameleft.text = info.teama.name;
    
    self.lb_nameright.text = info.teamb.name;
    
    self.lb_result.text = info.score;
}

@end
