//
//  MainHotpackscell.m
//  CikersApp
//
//  Created by fxm on 16/1/21.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MainHotpackscell.h"
#import "DicGameinfo.h"
#import "DicTeaminfo.h"
#import "DicPlayerinfo.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation MainHotpackscell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        _lb_info = [[UILabel alloc] initWithFrame:CGRectMake(80, 55, ScreenWidth - 85, 15)];
        _lb_info.textColor = self.detailTextLabel.textColor;
        [_lb_info.font fontWithSize:10];
        [self.contentView addSubview:_lb_info];
        
    }
    
    return self;
}

-(void)layoutSubviews
{

    self.imageView.bounds =CGRectMake(10,15,50,50);
    self.imageView.frame =CGRectMake(10,15,50,50);
    self.imageView.contentMode =UIViewContentModeScaleAspectFit;

    CGRect tmpFrame = self.textLabel.frame;
    tmpFrame.origin.x = 80;
    tmpFrame.origin.y = 10;
    tmpFrame.size.width = 200;
    tmpFrame.size.height = 20;
    self.textLabel.frame = tmpFrame;
    
    
    tmpFrame = self.detailTextLabel.frame;
    tmpFrame.origin.x = 80;
    tmpFrame.origin.y = 35;
    tmpFrame.size.width = 200;
    tmpFrame.size.height = 15;
    self.detailTextLabel.frame = tmpFrame;
    
    [self.detailTextLabel.font fontWithSize:10];
    
}

-(void)updateUI:(id)dic type:(NSInteger)type
{

    NSMutableString *str_url = [[NSMutableString alloc] initWithFormat:@"%@",HOST_IMAGE];
    NSString *str_name ;
    NSString *str_title;
    NSString *str_info;
    switch (type) {
        case 0:
        {
            DicGameinfo *info = (DicGameinfo*)dic;
            [str_url appendFormat:@"%@",info.icon];
            str_name = info.name;
            str_title = [NSString stringWithFormat:@"参赛队伍:%@ %@",info.teamcount,info.province];
            str_info = [NSString stringWithFormat:@"%@",info.starttime];
                                 
        }
            break;
        case 1:
        {
            DicTeaminfo *info = (DicTeaminfo*)dic;
            [str_url appendFormat:@"%@",info.icon];
            str_name = info.name;
            str_title = [NSString stringWithFormat:@"球员人数:%@",info.playercount];
            str_info = [NSString stringWithFormat:@"球队热度:%@",info.viewcount];
        }
            break;
        case 2:
        {
            DicPlayerinfo *info = (DicPlayerinfo*)dic;
            [str_url appendFormat:@"%@",info.icon];
            str_name = info.name;
            
            str_title = [NSString stringWithFormat:@"空间热度:%@",info.viewcount];
            str_info = [NSString stringWithFormat:@"所属球队:%@",info.belteam];
        }
            break;
        default:
            break;
    }
    
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:str_url] placeholderImage:PLACEHOLDER_IMG completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [self.imageView.image circleImage];
        
    }];
    
    self.textLabel.text = str_name;
    self.detailTextLabel.text = str_title;
    _lb_info.text = str_info;
}


@end
