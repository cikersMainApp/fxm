//
//  WikiCellMessage.m
//  CikersApp
//
//  Created by fxm on 16/1/27.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiCellMessage.h"
#import "UIView+SDAutoLayout.h"
#import "DicWikiInfo.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation WikiCellMessage

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
    
    
    
    self._picContainerView.sd_layout
    .leftEqualToView(self.lb_content);
    
    self.view_footer.sd_layout
    .leftSpaceToView(contentView,0)
    .rightSpaceToView(contentView,0)
    .topSpaceToView(self._picContainerView,margin)
    .heightIs(30);
    
    [self setupAutoHeightWithBottomView:self.view_footer bottomMargin:margin + 5];
}
- (void)setModel:(DicWikiInfo *)model
{
    [self.img_icon sd_setImageWithURL:SDIMAGEURL(model.icon) placeholderImage:PLACEHOLDER_IMG];
    self.lb_name.text = model.authorname;
    self.lb_time.text = model.time_createdon;
    self.lb_source.text =[NSString stringWithFormat:@"%@-%@",model.wikitype,model.contenttype];

    if ([model.content isEqual:[NSNull null]] || !model.content) {
        model.content = @"";
    }
    
    self.lb_content.text = model.content;
    

    //如果帖子是视频
    
    if ([model.contenttype isEqualToString:Wiki_type_video]) {
        [model.imgextra addObject:@"1"];

    }
    
    self._picContainerView.picPathStringsArray = model.imgextra;

    CGFloat picContainerTopMargin = 0;
    if (model.imgextra.count) {
        picContainerTopMargin = 10;
    }
    self._picContainerView.sd_layout.topSpaceToView(self.lb_content, picContainerTopMargin);
}

@end
