//
//  WikiInfoCellMessage.m
//  CikersApp
//
//  Created by fxm on 16/1/28.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiInfoCellMessage.h"
#import "UIView+SDAutoLayout.h"
#import <AVFoundation/AVFoundation.h>
@implementation WikiInfoCellMessage


+(NSString*)cellIdentifierForRow:(NSInteger)index
{

    switch (index) {
        case 0:
        {
        return  @"WikiInfoCellMessage";
        }
            break;
        case 1:
        {
        return @"UITableViewCell";
        }
            break;
        default:
            break;
    }
    
    return @"cell";
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat contentLabelFontSize = 15;

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
        
        
        self.lb_content.sd_layout
        .leftSpaceToView(contentView,margin)
        .topSpaceToView(self.img_icon, margin)
        .rightSpaceToView(contentView, margin)
        .minHeightIs(60)
        .autoHeightRatio(0);
        
        
        
        self._picContainerView.sd_layout
        .leftEqualToView(self.lb_content);
        
        self.view_footer.sd_layout
        .leftSpaceToView(contentView,0)
        .rightSpaceToView(contentView,0)
        .topSpaceToView(self._picContainerView,margin)
        .heightIs(30);
        
        [self setupAutoHeightWithBottomView:self.view_footer bottomMargin:margin + 5];

        
    }
    return self;
}

-(void)setData_obj_wiki:(DicWikiInfo *)data_obj_wiki
{
    DicWikiInfo *model = data_obj_wiki;
    
    [self.img_icon sd_setImageWithURL:SDIMAGEURL(model.icon) placeholderImage:PLACEHOLDER_IMG];
    self.lb_name.text = model.authorname;
    self.lb_time.text = model.time_createdon;
    self.lb_source.text =[NSString stringWithFormat:@"%@-%@",model.wikitype,model.contenttype];
    
    if ([model.content isEqual:[NSNull null]] || !model.content) {
        model.content = @"";
    }
    
    self.lb_content.text = model.content;
    
    
    
    self._picContainerView.picPathStringsArray = model.imgextra;
    
    CGFloat picContainerTopMargin = 0;
    if (model.imgextra.count) {
        picContainerTopMargin = 10;
    }
    self._picContainerView.sd_layout.topSpaceToView(self.lb_content, picContainerTopMargin);
    
    
    //如果帖子是视频
    
    if ([model.contenttype isEqualToString:Wiki_type_video]) {
        self._picContainerView.sd_layout
        .leftSpaceToView(self.contentView,10)
        .rightSpaceToView(self.contentView,10)
        .heightIs(200);

        
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.size.width - 20, 200)];
        img.backgroundColor = [UIColor yellowColor];
        [img setImage:[self thumbnailImageForVideo:[NSURL URLWithString:@"http://124.232.154.173/youku/67774226A883683168CDDA659A/03000805005153359910D703BAF2B17CDDDAF7-77C8-0F5A-F0BC-6BD2DA2B0B00.mp4"]]];
        [self._picContainerView addSubview:img];
        

    }

}
//获取视频封面，本地视频，网络视频都可以用

- (UIImage*) thumbnailImageForVideo:(NSURL *)videoURL
{
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    gen.appliesPreferredTrackTransform = YES;
    
    CMTime time = CMTimeMakeWithSeconds(2.0, 600);
    
    NSError *error = nil;
    
    CMTime actualTime;
    
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    
    UIImage *thumbImg = [[UIImage alloc] initWithCGImage:image];
    
    return thumbImg;
    
}
@end
