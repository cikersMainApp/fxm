//
//  WikiCellEvent.m
//  CikersApp
//
//  Created by fxm on 16/1/27.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiCellEvent.h"
#import "UIView+SDAutoLayout.h"
@implementation WikiCellEvent

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
    
    
    self.view_eventbg = [[UIView alloc] init];
    [contentView addSubview:self.view_eventbg];
    self.view_eventbg.backgroundColor = [UIColor grayColor];
    
    self.lb_eventtime = [[UILabel alloc] init];
    self.lb_eventtime.textAlignment = NSTextAlignmentCenter;
    [self.view_eventbg addSubview:self.lb_eventtime];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view_eventbg addSubview:view];
    
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
- (void)setModel:(DicWikiInfo *)model
{
    [self.img_icon sd_setImageWithURL:SDIMAGEURL(model.icon) placeholderImage:PLACEHOLDER_IMG];
    self.lb_name.text = model.authorname;
    self.lb_time.text = model.time_createdon;
    self.lb_content.text = [NSString stringWithFormat:@"活动内容:%@",model.content];
    self.lb_source.text =[NSString stringWithFormat:@"发表于 %@",model.cnname];
    self.lb_eventtime.text = model.time_eventOn;
    
    
}
@end
