//
//  PersonalHead.m
//  CikersApp
//
//  Created by fxm on 16/1/29.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "PersonalHead.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation PersonalHead

-(void)updateUI:(DicUserinfo *)info
{
    [self.img_icon sd_setImageWithURL:SDIMAGEURL(info.icon) placeholderImage:PLACEHOLDER_IMG];
    self.lb_name.text = info.name;
    
    self.lb_info.text = [NSString stringWithFormat:@"关注%@ 动态%@ 粉丝%@ 人气%@",info.followcount,info.postcount,info.followercount,info.favorcount];
    
}

@end
