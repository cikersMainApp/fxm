//
//  TounamentPlayerCell.m
//  CikersApp
//
//  Created by fxm on 16/1/15.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "TounamentPlayerCell.h"
#import "UIView+SDAutoLayout.h"
#import "SDWebImage/UIImageView+WebCache.h"
@implementation TounamentPlayerCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        UIView *viewbg = self.contentView;
        
        NSLog(@"width :%f",viewbg.frame.size.width);

        NSLog(@"height:%f",viewbg.frame.size.height);
        
        
        UIView *view_1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, CELL_NORMAL_HEIGHT)];
        [view_1 setBackgroundColor:[UIColor orangeColor]];
        [viewbg addSubview:view_1];
        
        
        UIView *view_2 = [[UIView alloc] initWithFrame:CGRectMake(200, 0, 350, CELL_NORMAL_HEIGHT)];
        [view_2 setBackgroundColor:[UIColor yellowColor]];
        [viewbg addSubview:view_2];
        
        UIView *view_3 = [[UIView alloc] initWithFrame:CGRectMake(200, 0, 70, CELL_NORMAL_HEIGHT)];
        [view_3 setBackgroundColor:[UIColor blackColor]];
        [viewbg addSubview:view_3];
        
        
        view_3.sd_layout
        .rightSpaceToView(viewbg,10)
        .topSpaceToView(viewbg,0)
        .bottomSpaceToView(viewbg,0)
        .widthIs(70);
        
//        _image1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
//        [self.contentView addSubview:_image1];
//        _image2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
//        [self.contentView addSubview:_image2];
//        _lb_1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
//        _lb_2 = [[UILabel alloc] init];
//        _lb_1.textAlignment = NSTextAlignmentCenter;
//        _lb_2.textAlignment = NSTextAlignmentCenter;
//        [_lb_1.font fontWithSize:10];
//        [_lb_2.font fontWithSize:10];
//        [self.contentView addSubview:_lb_1];
//        [self.contentView addSubview:_lb_2];
//        
//        _lb_score = [[UILabel alloc] init];
//        _lb_score.textAlignment = NSTextAlignmentCenter;
//        [self.contentView addSubview:_lb_score];
//        
//        UIView *view = self.contentView;
//        
//        _image1.sd_layout
//        .leftSpaceToView(view,20)
//        .topSpaceToView(view,10)
//        .widthIs(40)
//        .heightIs(40);
//        
//        _lb_1.sd_layout
//        .leftSpaceToView(_image1,0)
//        .topSpaceToView(view,0)
//        .bottomSpaceToView(view,0)
//        .widthIs(40);
//        
//        
//        _image2.sd_layout
//        .leftSpaceToView(_lb_1,5)
//        .topSpaceToView(view,10)
//        .widthIs(40)
//        .heightIs(40);
//        
//        _lb_2.sd_layout
//        .leftSpaceToView(_image2,0)
//        .topSpaceToView(view,0)
//        .bottomSpaceToView(view,0)
//        .widthIs(115);
//
//        
//        
//        _lb_score.sd_layout
//        .rightSpaceToView(self.contentView,50)
//        .topSpaceToView(self.contentView,0)
//        .bottomSpaceToView(self.contentView,0)
//        .widthIs(50);
        
    }
    
    return self;
}

-(void)updateUI:(id)dic
{

//    [_image1 setImage:PLACEHOLDER_IMG];
//    [_image2 setImage:PLACEHOLDER_IMG];
//    
//    [_lb_1 setText:@"我是测试"];
//    [_lb_2 setText:@"湖南大学中文系07级2班男队"];
//    
//    [_lb_score setText:@"10"];
    
    
}

@end

#pragma mark -
#pragma mark TounamentPlayerRankCell

@implementation TounamentPlayerRankCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        UIView *view = self.contentView;
        
        _image = [[UIImageView alloc] init];
        _lb = [[UILabel alloc] init];
        _lb_red=[[UILabel alloc] init];
        _lb_yellow=[[UILabel alloc] init];
        
        [_lb.font fontWithSize:10];
        [_lb_red.font fontWithSize:12];
        [_lb_yellow.font fontWithSize:12];
        
        [view addSubview:_image];
        [view addSubview:_lb];
        [view addSubview:_lb_red];
        [view addSubview:_lb_yellow];
        
        _image.sd_layout
        .leftSpaceToView(view,20)
        .topSpaceToView(view,10)
        .widthIs(40)
        .heightIs(40);
        
        _lb.sd_layout
        .leftSpaceToView(_image,0)
        .topSpaceToView(view,0)
        .heightIs(view.frame.size.height)
        .widthIs(110);
        
        _lb_red.sd_layout
        .rightSpaceToView(view,30)
        .topSpaceToView(view,0)
        .heightIs(view.frame.size.height)
        .widthIs(60);
        
        _lb_yellow.sd_layout
        .rightSpaceToView(_lb_red,10)
        .topSpaceToView(view,0)
        .heightIs(view.frame.size.height)
        .widthIs(60);

    }
    
    
    return self;
}

-(void)updateUI:(id)dic
{

    [_image setImage:PLACEHOLDER_IMG];
    _lb.text = @"黄河队";
    
    
    NSInteger num_h = 20;
    
    num_h = (_num_tag/5 == 0)?num_h:60;
    
    
    _image.sd_layout
    .leftSpaceToView(self.contentView,num_h)
    .topSpaceToView(self.contentView,10)
    .widthIs(40)
    .heightIs(40);
    
    _lb.sd_layout
    .leftSpaceToView(_image,0)
    .topSpaceToView(self.contentView,0)
    .heightIs(self.contentView.frame.size.height)
    .widthIs(110);
    
    
    _lb_red.text = @"10";
    _lb_yellow.text = @"10";
    
}

@end


