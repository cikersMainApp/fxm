//
//  ThreeFirstCell.m
//  SDAutoLayoutDemo
//
//  Created by lixiya on 16/1/14.
//  Copyright © 2016年 lixiya. All rights reserved.
//

#import "ThreeFirstCell.h"

@implementation ThreeFirstCell


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
    
    self.imgIcon.sd_layout
    .rightSpaceToView(self.contentView,margin)
    .topSpaceToView(self.contentView,margin)
    .widthIs(90)
    .heightIs(65);
    
    self.lblTitle.sd_layout
    .rightSpaceToView(self.imgIcon ,margin)
    .topSpaceToView(self.contentView,margin)
    .leftSpaceToView(self.contentView,margin)
    .heightIs(21);
    
    self.lblSubtitle.sd_layout
    .topSpaceToView(self.lblTitle,3)
    .rightSpaceToView(self.imgIcon,margin)
    .leftSpaceToView(self.contentView,margin)
    .heightIs(30);
    
    self.lineView.sd_layout
    .topSpaceToView(self.imgIcon,margin)
    .rightSpaceToView(self.contentView,0)
    .leftSpaceToView(self.contentView,0)
    .heightIs(1);
    
    self.lblinfo.sd_layout
    .rightSpaceToView(self.imgIcon,margin)
    .leftSpaceToView(self.contentView,margin)
    .bottomSpaceToView(self.lineView,1)
    .heightIs(20);
    
    self.lbltime.sd_layout
    .rightSpaceToView(self.imgIcon,margin)
    .bottomSpaceToView(self.lineView,1)
    .widthIs(100)
    .heightIs(20);

    
    [self setupAutoHeightWithBottomView:self.lineView bottomMargin:0];
}


-(void)setThreeModel:(DicWikiInfo *)threeModel{

    self.lbltime.text = threeModel.time_createdon;
    self.lblTitle.text = threeModel.shortTitle;
    self.lblSubtitle.text = [NSString stringWithFormat:@"%@",threeModel.title];
    
    self.lblinfo.text = [NSString stringWithFormat:@"%@     %@评论    %@赞",threeModel.authorname,threeModel.commentcount,threeModel.favorcount];
    
    if ([threeModel.contenttype isEqual:Wiki_type_video])
    {
        [self.imgIcon setImage:PLACEHOLDER_VIDEO];
    }
    if ([threeModel.contenttype isEqual:Wiki_type_image])
    {
        NSString *strurl = @"123";
        
        strurl = ([threeModel.imgextra count] == 0)?strurl:[threeModel.imgextra objectAtIndex:0];
        
        [self.imgIcon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HOST_IMAGE,strurl]] placeholderImage:PLACEHOLDER_IMG];

    }
    

}


@end
