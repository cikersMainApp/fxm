//
//  TeamMainCell.m
//  CikersApp
//
//  Created by fxm on 16/1/22.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "TeamMainCell.h"

@implementation TeamMainCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)updateInfo:(DicTeaminfo*)dic
{

    
    
    [_img_icon sd_setImageWithURL:SDIMAGEURL(dic.icon) placeholderImage:PLACEHOLDER_IMG];
    _lb_name.text = dic.cnname;
    _lb_address.text = dic.province;
    _lb_info.text = [NSString stringWithFormat:@"队员%@  |动态%@  |粉丝%@  |人气%@",dic.playercount,dic.eventcount,dic.viewcount,@"0"];
        
}
-(void)updateTag:(NSArray*)dic
{

    if ([dic count] == 0)
        _lb_tagsTip.text = @"没有更多标签";
}


@end
