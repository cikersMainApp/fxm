//
//  WikiCellComment.m
//  CikersApp
//
//  Created by fxm on 16/3/16.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiCellComment.h"
#import "UIView+SDAutoLayout.h"
@implementation WikiCellComment

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self._shouldOpenContentLabel = NO;
        
        _img_icon = [[UIImageView alloc] init];
        
        _lb_name = [[UILabel alloc] init];
        _lb_name.font = [UIFont systemFontOfSize:14];
        _lb_name.textColor = [UIColor colorWithRed:(54 / 255.0) green:(71 / 255.0) blue:(121 / 255.0) alpha:0.9];
        
        _lb_source = [[UILabel alloc] init];
        _lb_source.font = [UIFont systemFontOfSize:13];
        
        _lb_content = [[UILabel alloc] init];
//        _lb_content.font = [UIFont systemFontOfSize:contentLabelFontSize];
        _lb_content.numberOfLines = 2;
        
        
        
        self._picContainerView = [[WikiPhotoView alloc] init];
        
        _lb_time = [[UILabel alloc] init];
        _lb_time.font = [UIFont systemFontOfSize:13];
        _lb_time.textColor = [UIColor lightGrayColor];
        _lb_time.textAlignment = NSTextAlignmentRight;
        
        _view_footer = [[UIView alloc] init];
        _view_footer.backgroundColor = [UIColor orangeColor];
        
        NSArray *views = @[_img_icon, _lb_name,_lb_time, _lb_content,_lb_source, self._picContainerView, _view_footer];
        
        [views enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.contentView addSubview:obj];
        }];


        
        [self setup];
    }
    return self;
}
-(void)setup
{
    UIView *contentView = self.contentView;
    CGFloat margin = 10;
    
    
    self.view_eventbg = [[UIView alloc] init];
    [contentView addSubview:self.view_eventbg];
    self.view_eventbg.backgroundColor = [UIColor grayColor];
    
    self.lb_eventtime = [[UILabel alloc] init];
    self.lb_eventtime.textAlignment = NSTextAlignmentCenter;
    [self.view_eventbg addSubview:self.lb_eventtime];
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
//    view.backgroundColor = [UIColor orangeColor];
//    [self.view_eventbg addSubview:view];
    
    self.lb_content.sd_layout
    .leftSpaceToView(contentView,margin)
    .topSpaceToView(self.img_icon, margin)
    .rightSpaceToView(contentView, margin)
    .heightIs(40);
    
    self.view_eventbg.sd_layout
    .topSpaceToView(self.lb_content,20)
    .leftSpaceToView(contentView,margin)
    .rightSpaceToView(contentView,margin)
    .heightIs(30);
    
    self.lb_eventtime.sd_layout
    .topSpaceToView(self.view_eventbg,0)
    .rightSpaceToView(self.view_eventbg,0)
    .leftSpaceToView(self.view_eventbg,0)
    .bottomSpaceToView(self.view_eventbg,0);
    
    self.view_footer.sd_layout
    .leftSpaceToView(contentView,0)
    .rightSpaceToView(contentView,0)
    .topSpaceToView(self.view_eventbg,margin)
    .heightIs(30);
    
    [self setupAutoHeightWithBottomView:self.view_footer bottomMargin:margin + 5];
    
}

//-(void)cellUpdata:(DicWikiComments *)model
//{
//    [self.img_icon sd_setImageWithURL:SDIMAGEURL(model.authorportrait) placeholderImage:PLACEHOLDER_IMG];
//    self.lb_name.text = model.author;
//    self.lb_content.text = model.wikicontent;
//
//}
//
//- (void)setModel:(DicWikiComments *)model
//{
//    [self.img_icon sd_setImageWithURL:SDIMAGEURL(model.authorportrait) placeholderImage:PLACEHOLDER_IMG];
//    self.lb_name.text = model.author;
////    self.lb_time.text = model.time_createdon;
//    self.lb_content.text = model.wikicontent;
////    self.lb_source.text =[NSString stringWithFormat:@"发表于 %@",model.cnname];
////    self.lb_eventtime.text = model.time_eventOn;
//    
//    
//}


-(void)setModel:(DicWikiComments *)model
{
    [self.img_icon sd_setImageWithURL:SDIMAGEURL(model.authorportrait) placeholderImage:PLACEHOLDER_IMG];
    self.lb_name.text = model.author;
    self.lb_content.text = model.wikicontent;
}


@end
