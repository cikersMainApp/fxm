//
//  TeamPlayerCell.m
//  CikersApp
//
//  Created by fxm on 16/1/26.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "TeamPlayerCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation TeamPlayerCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _lb_status = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, self.contentView.frame.size.height)];
        _lb_status.text = @"15/15";
        self.accessoryView = _lb_status;
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews
{

    [super layoutSubviews];
    
    self.imageView.bounds =CGRectMake(10,15,50,50);
    self.imageView.frame =CGRectMake(10,15,50,50);
    self.imageView.contentMode =UIViewContentModeScaleAspectFit;
    
    CGRect tmpFrame = self.textLabel.frame;
    tmpFrame.origin.x = 80;
    self.textLabel.frame = tmpFrame;
    
    CGRect accessFrame = self.accessoryView.frame;
    accessFrame.origin.x += 20;
    self.accessoryView.frame = accessFrame;
    
}

-(void)updateUI:(DicPlayerinfo *)info
{

    [self.imageView sd_setImageWithURL:SDIMAGEURL(info.icon) placeholderImage:PLACEHOLDER_IMG];
    self.textLabel.text = info.name;
    self.detailTextLabel.text = info.name;
    
}

@end
