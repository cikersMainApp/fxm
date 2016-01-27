//
//  PlayerMainInfoView.m
//  CikersApp
//
//  Created by fxm on 16/1/26.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "PlayerMainInfoView.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation PlayerMainInfoView



-(void)updateInfo:(DicPlayerinfo*)dic
{
    
    
    
    [_img_icon sd_setImageWithURL:SDIMAGEURL(dic.icon) placeholderImage:PLACEHOLDER_IMG];
    _lb_name.text = dic.name;
//    _lb_address.text = dic.province;
//    _lb_info.text = [NSString stringWithFormat:@"关注%@  |动态%@  |粉丝%@  |人气%@",dic.playercount,dic.eventcount,dic.viewcount,@"0"];
    
}
-(void)updateTag:(NSArray*)dic
{
    
    if ([dic count] == 0)
        _lb_tagsTip.text = @"没有更多标签";
}

@end