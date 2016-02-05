//
//  WikiCellMatch.m
//  CikersApp
//
//  Created by fxm on 16/1/27.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiCellMatch.h"
#import "UIView+SDAutoLayout.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation WikiCellMatch


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setup];
    }
    return self;
}
-(void)setup
{
    UIView *contentView = self.contentView;
    CGFloat margin = 10;
    
    
    _viewmatch = [[UIView alloc] init];
    _viewmatch.backgroundColor = [UIColor lightGrayColor];
    [contentView addSubview:_viewmatch];
    
    
    self.lb_content.sd_layout
    .leftSpaceToView(contentView,margin)
    .topSpaceToView(self.img_icon, margin)
    .rightSpaceToView(contentView, margin)
    .heightIs(40);
    
    _viewmatch.sd_layout
    .topSpaceToView(self.lb_content,margin)
    .leftSpaceToView(contentView,margin)
    .rightSpaceToView(contentView,margin)
    .heightIs(50);
    
    self.view_footer.sd_layout
    .leftSpaceToView(contentView,0)
    .rightSpaceToView(contentView,0)
    .topSpaceToView(_viewmatch,margin)
    .heightIs(30);
    
    [self setupAutoHeightWithBottomView:self.view_footer bottomMargin:margin + 5];
    
    
    [self initData];
}

-(void)initData
{

    float cellwidth = self.contentView.frame.size.width - 20;
    float cellheight= _viewmatch.frame.size.height;
    
    _lbAname = [[UILabel alloc] init];
    _lbAname.textAlignment =NSTextAlignmentRight;
    _lbBname = [[UILabel alloc] init];
    _lbScore = [[UILabel alloc] init];
    _lbScore.textAlignment = NSTextAlignmentCenter;
    _lbScore.textColor = [UIColor orangeColor];
    _img_iconA = [[UIImageView alloc] init];
    _img_iconB = [[UIImageView alloc] init];
    
    NSArray *views = @[_lbAname, _lbBname,_lbScore, _img_iconA,_img_iconB];
    
    [views enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [_viewmatch addSubview:obj];
    }];
    
    
    _lbAname.sd_layout
    .leftSpaceToView(_viewmatch,0)
    .topSpaceToView(_viewmatch,0)
    .bottomSpaceToView(_viewmatch,0)
    .widthIs(cellwidth/3.0f);
    
    
    _lbBname.sd_layout
    .rightSpaceToView(_viewmatch,0)
    .topSpaceToView(_viewmatch,0)
    .bottomSpaceToView(_viewmatch,0)
    .widthIs(cellwidth/3.0f);

    _img_iconA.sd_layout
    .leftSpaceToView(_lbAname,10)
    .heightIs(35)
    .widthIs(35)
    .topSpaceToView(_viewmatch,5);

    _img_iconB.sd_layout
    .rightSpaceToView(_lbBname,10)
    .heightIs(35)
    .widthIs(35)
    .topSpaceToView(_viewmatch,5);


    _lbScore.sd_layout
    .heightIs(cellheight)
    .topSpaceToView(_viewmatch,0)
    .leftSpaceToView(_viewmatch,0)
    .rightSpaceToView(_viewmatch,0);
}

- (void)setModel:(DicWikiInfo *)model
{
    [self.img_icon sd_setImageWithURL:SDIMAGEURL(model.icon) placeholderImage:PLACEHOLDER_IMG];
    self.lb_name.text = model.authorname;
    self.lb_time.text = model.time_createdon;
    self.lb_content.text = model.content;
    self.lb_source.text =[NSString stringWithFormat:@"发表于 %@",model.tname];
    
    _lbAname.text = model.teamAname;
    _lbBname.text = model.teamBname;
    
    [_img_iconA sd_setImageWithURL:SDIMAGEURL(model.teamAicon) placeholderImage:PLACEHOLDER_IMG];
    [_img_iconB sd_setImageWithURL:SDIMAGEURL(model.teamBicon) placeholderImage:PLACEHOLDER_IMG];
    
    _lbScore.text = [NSString stringWithFormat:@"%@--%@",model.scorea,model.scoreb];
}
@end
