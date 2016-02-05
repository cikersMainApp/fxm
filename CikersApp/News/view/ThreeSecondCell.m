//
//  ThreeSecondCell.m
//  SDAutoLayoutDemo
//
//  Created by lixiya on 16/1/14.
//  Copyright © 2016年 lixiya. All rights reserved.
//

#import "ThreeSecondCell.h"

@implementation ThreeSecondCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setup];
    }
    return self;
}

-(void)setup{
    
    // 设置约束
    CGFloat margin = 10;
    UIView * contentView = self.contentView;

    NSArray * equalSubViews = [NSArray arrayWithObjects:self.imgIcon,self.imgOther1,self.imgOther2,nil];
    self.contentView.sd_equalWidthSubviews = equalSubViews;
    
    self.lblTitle.sd_layout
    .topSpaceToView(contentView,margin)
    .leftSpaceToView(contentView,margin)
    .rightSpaceToView(contentView,margin)
    .heightIs(21);
    
    self.imgIcon.sd_layout
    .leftSpaceToView(contentView,margin)
    .topSpaceToView(self.lblTitle,margin)
    .autoHeightRatio(0.75);
    
    self.imgOther1.sd_layout
    .leftSpaceToView(self.imgIcon,margin)
    .topSpaceToView(self.lblTitle,margin)
    .autoHeightRatio(0.75);

    self.imgOther2.sd_layout
    .leftSpaceToView(self.imgOther1,margin)
    .rightSpaceToView(contentView,margin)
    .topSpaceToView(self.lblTitle,margin)
    .autoHeightRatio(0.75);
    
    self.lineView.sd_layout
    .topSpaceToView(self.imgOther2,margin+20)
    .leftSpaceToView(contentView,margin)
    .rightSpaceToView(contentView,margin)
    .heightIs(1);

    self.lblinfo.sd_layout
    .rightSpaceToView(self.contentView,margin)
    .leftSpaceToView(self.contentView,margin)
    .bottomSpaceToView(self.lineView,1)
    .heightIs(20);
    
    
    self.lbltime.sd_layout
    .rightSpaceToView(self.contentView,margin)
    .bottomSpaceToView(self.lineView,1)
    .widthIs(100)
    .heightIs(20);
    
    [self setupAutoHeightWithBottomView:self.lineView bottomMargin:0];

}

-(void)setThreeModel:(DicWikiInfo *)threeModel{

    self.lbltime.text = threeModel.time_createdon;

    self.lblTitle.text = threeModel.shortTitle;

    NSString *strurl = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,threeModel.imgextra[0]];
    [self.imgIcon sd_setImageWithURL:[NSURL URLWithString:strurl] placeholderImage:PLACEHOLDER_IMG ];

    // 多图
    NSString *strurl1 = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,threeModel.imgextra[1]];
    NSString *strurl2 = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,threeModel.imgextra[2]];
    [self.imgOther1 sd_setImageWithURL:[NSURL URLWithString:strurl1] placeholderImage:PLACEHOLDER_IMG ];
    [self.imgOther2 sd_setImageWithURL:[NSURL URLWithString:strurl2] placeholderImage:PLACEHOLDER_IMG ];
    
    self.lblinfo.text = [NSString stringWithFormat:@"%@     %@评论    %@赞",threeModel.authorname,threeModel.viewcount,threeModel.favorcount];

}

@end
