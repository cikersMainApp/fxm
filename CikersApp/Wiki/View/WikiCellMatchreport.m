//
//  WikiCellMatchreport.m
//  CikersApp
//
//  Created by fxm on 16/1/27.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiCellMatchreport.h"
#import "UIView+SDAutoLayout.h"

@implementation WikiCellMatchreport


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
    
    self.lb_content.sd_layout
    .leftSpaceToView(contentView,margin)
    .topSpaceToView(self.img_icon, margin)
    .rightSpaceToView(contentView, margin)
    .heightIs(40);
    
    

    
    self.view_footer.sd_layout
    .leftSpaceToView(contentView,0)
    .rightSpaceToView(contentView,0)
    .topSpaceToView(self.lb_content,margin)
    .heightIs(30);
    
    [self setupAutoHeightWithBottomView:self.view_footer bottomMargin:margin + 5];
    
}
- (void)setModel:(DicWikiInfo *)model
{
    [self.img_icon sd_setImageWithURL:SDIMAGEURL(model.icon) placeholderImage:PLACEHOLDER_IMG];
    self.lb_name.text = model.authorname;
    self.lb_time.text = model.time_createdon;
    self.lb_source.text =model.wikitype;
}
@end
