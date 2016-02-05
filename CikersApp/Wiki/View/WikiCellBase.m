//
//  WikiCellBase.m
//  CikersApp
//
//  Created by fxm on 16/1/27.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiCellBase.h"
#import "UIView+SDAutoLayout.h"
const CGFloat contentLabelFontSize = 15;
const CGFloat maxContentLabelHeight = 54;

#define WIKICELLFOOTHEIGHT 50

@implementation WikiCellBase

+(NSString *)cellIdentifierForRow:(DicWikiInfo *)info
{
    if([info.wikitype isEqual:WIKI_TYPE_MATCH]) return @"WikiCellMatch";
    if([info.wikitype isEqual:WIKI_TYPE_MATCHREPORT]) return @"WikiCellMatchreport";
    if([info.wikitype isEqual:WIKI_TYPE_MESSAGE]) return @"WikiCellMessage";
    if([info.wikitype isEqual:WIKI_TYPE_PREDICTION]) return @"WikiCellPrediction";
    if([info.wikitype isEqual:WIKI_TYPE_EVENT]) return @"WikiCellEvent";
    
    
    return @"WikiCellMessage";
}

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
        _lb_content.font = [UIFont systemFontOfSize:contentLabelFontSize];
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
        
        UIView *contentView = self.contentView;
        CGFloat margin = 10;
        
        self.img_icon.sd_layout
        .leftSpaceToView(contentView, margin)
        .topSpaceToView(contentView, margin + 5)
        .widthIs(40)
        .heightIs(40);
        
        self.lb_name.sd_layout
        .leftSpaceToView(self.img_icon, margin)
        .topEqualToView(self.img_icon)
        .heightIs(18);
        [self.lb_name setSingleLineAutoResizeWithMaxWidth:200];
        
        self.lb_source.sd_layout
        .leftSpaceToView(self.img_icon, margin)
        .topSpaceToView(self.lb_name,margin)
        .heightIs(18)
        .widthIs(200);
        
        self.lb_time.sd_layout
        .rightSpaceToView(contentView,margin)
        .leftSpaceToView(contentView,margin)
        .topSpaceToView(contentView, margin+5)
        .heightIs(15);
        
        
        
        UIImageView *imagetemp = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, WIKICELLFOOTHEIGHT)];
        imagetemp.image = [UIImage imageNamed:@"icon_wiki_footbg"];
        [self.view_footer addSubview:imagetemp];

    }
    return self;
}


@end
