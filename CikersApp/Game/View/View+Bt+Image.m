//
//  View+Bt+Image.m
//  CikersApp
//
//  Created by fxm on 16/1/14.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "View+Bt+Image.h"
#import "SDWebImage/UIButton+WebCache.h"
@implementation View_Bt_Image

-(instancetype)initWithFrame:(CGRect)frame lable:(NSString*)text imageurl:(NSString *)imageurl
{

    if (self = [super initWithFrame:frame])
    {
        
        _imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageurl]];
        
        [_imageview setFrame:CGRectMake(5, frame.size.height - 10, frame.size.height - 20, frame.size.height - 20)];
        [self addSubview:_imageview];
        [_imageview setBackgroundColor:COLOR_GRAY];
        
        
        _lb = [[UILabel alloc] init];
        _lb.text = text;
        [self addSubview:_lb];

        [_lb setFrame:CGRectMake(frame.size.width -  5 - 3 - _bt.frame.size.width, 0, frame.size.width - _bt.frame.size.width, frame.size.height)];
        
        _lb.textAlignment = NSTextAlignmentCenter;
        _lb.textAlignment = NSTextAlignmentLeft;
        
        _lb.font = [UIFont systemFontOfSize:13];
        _lb.backgroundColor = [UIColor orangeColor];

    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame lable:(NSString*)text imageurl:(NSString *)imageurl placeholder:(NSString*)placeholder
{
    
    if (self = [super initWithFrame:frame])
    {
        _imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageurl]];
        [_imageview setFrame:CGRectMake(5, frame.size.height - 10, frame.size.height - 20, frame.size.height - 20)];
        [self addSubview:_imageview];
        [_imageview setBackgroundColor:COLOR_GRAY];
        
        _lb = [[UILabel alloc] init];
        _lb.text = text;
        [self addSubview:_lb];
        
        [_lb setFrame:CGRectMake(frame.size.width -  5 - 3 - _bt.frame.size.width, 0, frame.size.width - _bt.frame.size.width, frame.size.height)];
        
        _lb.textAlignment = NSTextAlignmentCenter;
        _lb.textAlignment = NSTextAlignmentLeft;

        _lb.font = [UIFont systemFontOfSize:13];

        _lb.backgroundColor = [UIColor orangeColor];
    }
    
    return self;
}
-(void)updateUIBylable:(NSString *)text imageurl:(NSString *)imageurl
{

    [_bt sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HOST_IMAGE,imageurl]] forState:UIControlStateNormal placeholderImage:PLACEHOLDER_IMG];
    
    _lb.text = text;
    
}

@end
