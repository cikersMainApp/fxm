//
//  WikiAllCell.m
//  CikersApp
//
//  Created by fxm on 16/1/5.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiAllCell.h"
#import "WikiPhotoView.h"
#import "UIView+SDAutoLayout.h"
#import "WIkiModel.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation WikiAllCell
{
    UIImageView *_iconView;
    UILabel *_nameLable;
    UILabel *_contentLabel;
    WikiPhotoView *_picContainerView;
    UILabel *_timeLabel;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    _iconView = [UIImageView new];
    
    _nameLable = [UILabel new];
    _nameLable.font = [UIFont systemFontOfSize:14];
    _nameLable.textColor = [UIColor colorWithRed:(54 / 255.0) green:(71 / 255.0) blue:(121 / 255.0) alpha:0.9];
    
    _contentLabel = [UILabel new];
    _contentLabel.font = [UIFont systemFontOfSize:12];
    
    _picContainerView = [WikiPhotoView new];
    
    _timeLabel = [UILabel new];
    _timeLabel.font = [UIFont systemFontOfSize:13];
    _timeLabel.textColor = [UIColor lightGrayColor];
    _timeLabel.textAlignment = NSTextAlignmentRight;
    
    
    
    NSArray *views = @[_iconView, _nameLable, _contentLabel, _picContainerView, _timeLabel];
    
    [views enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.contentView addSubview:obj];
    }];
    
    UIView *contentView = self.contentView;
    CGFloat margin = 10;
    
    _iconView.sd_layout
    .leftSpaceToView(contentView, margin)
    .topSpaceToView(contentView, margin + 5)
    .widthIs(40)
    .heightIs(40);
    
    _nameLable.sd_layout
    .leftSpaceToView(_iconView, margin)
    .topEqualToView(_iconView)
    .heightIs(18);
    [_nameLable setSingleLineAutoResizeWithMaxWidth:200];
    
    _contentLabel.sd_layout
    .leftSpaceToView(contentView,margin)
    .topSpaceToView(_iconView, margin)
    .rightSpaceToView(contentView, margin)
    .heightIs(35);
    
    _picContainerView.sd_layout
    .leftEqualToView(_contentLabel);
    
    _timeLabel.sd_layout
    .rightSpaceToView(contentView,10)
    .topSpaceToView(contentView, margin)
    .heightIs(15)
    .widthIs(150)
    .autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomView:_picContainerView bottomMargin:margin + 5];
    
}


- (void)setModel:(WIkiModel *)model
{
    _model = model;
    
    NSString *url1 = [NSString stringWithFormat:@"http://www.cikers.com%@",model.icon];

    
    [_iconView  sd_setImageWithURL:[NSURL URLWithString:url1] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        _nameLable.text = model.authorname;
        _contentLabel.text = model.content;
        
    }];

    CGFloat picContainerTopMargin = 0;

    if ([model.contenttype isEqual:Wiki_type_image])
    {
        _picContainerView.picPathStringsArray = model.image;

        picContainerTopMargin = 10;

    }
    
    _picContainerView.sd_layout.topSpaceToView(_contentLabel, picContainerTopMargin);
  
    _timeLabel.text = model.time;
}


@end
