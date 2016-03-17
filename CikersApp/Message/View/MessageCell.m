//
//  MessageCell.m
//  CikersApp
//
//  Created by fxm on 16/1/18.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (void)awakeFromNib {
    // Initialization code
    
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _lb_time = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth - 105, 15, 100, 30)];
        _lb_time.textAlignment = NSTextAlignmentRight;
        _lb_time.textAlignment = NSTextAlignmentCenter;
        _lb_time.font = [UIFont systemFontOfSize:12];
        [self addSubview:_lb_time];
        
        _view_status = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth - 40, 50, 30, 30)];
        _view_status.backgroundColor = [UIColor redColor];
        [self addSubview:_view_status];
        
    }
    
    return self;
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
    tmpFrame.origin.y-= 5;
    self.textLabel.frame = tmpFrame;

    CGRect accessFrame = self.detailTextLabel.frame;
    accessFrame.origin.x = 80;
    accessFrame.origin.y += 5;
    self.detailTextLabel.frame = accessFrame;
    self.detailTextLabel.textColor = [UIColor lightGrayColor];

    
}

-(void)cellUpdata:(DicMessage *)dic_msg
{
    
    _data_obj = dic_msg;
    
    [self.imageView sd_setImageWithURL:SDIMAGEURL(dic_msg.icon) placeholderImage:PLACEHOLDER_IMG];
    self.textLabel.text =dic_msg.type;
    self.detailTextLabel.text = [NSString stringWithFormat:@"%@%@",dic_msg.authorname,dic_msg.content];
    _lb_time.text = dic_msg.time_pubdate;

    _view_status.hidden = !dic_msg.bool_readstatus;
    
}

@end
