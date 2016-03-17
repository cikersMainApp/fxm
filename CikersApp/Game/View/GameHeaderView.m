//
//  GameHeaderView.m
//  CikersApp
//
//  Created by fxm on 16/1/12.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "GameHeaderView.h"
#import "UIView+SDAutoLayout.h"
#import "GameItemBt.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "ARLabel.h"
@implementation GameHeaderView

-(void)initUI
{
    if (!self.data_obj_info)
    {
        return;
    }
    self.backgroundColor = [UIColor grayColor];
    
    //info
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];

    [self initSection1:view];
    
    //tags
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 210)];

    [self initSection2:view1];
    
    //button
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 98)];

    [self initSection3:view2];
    
    
    [self addSubview:view];
    [self addSubview:view1];
    [self addSubview:view2];
    
    
//    self.sd_equalWidthSubviews = @[view,view1,view2];
    
    view.sd_layout
    .topSpaceToView(self,0)
    .leftSpaceToView(self,0)
    .rightSpaceToView(self,0)
    .heightIs(214);
    
    view1.sd_layout
    .topSpaceToView(view,10)
    .leftSpaceToView(self,0)
    .rightSpaceToView(self,0)
    .heightIs(120);


    view2.sd_layout
    .topSpaceToView(view1,10)
    .leftSpaceToView(self,0)
    .rightSpaceToView(self,0)
    .heightIs(40);


    
    
}

-(void)initSection1:(UIView*)view
{

    view.backgroundColor = [UIColor whiteColor];
    
    
    //加载info icon width is 110
    
    UIView *section_view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 5, ScreenWidth, 100)];
    [view addSubview:section_view1];
    
    section_view1.sd_layout
    .leftSpaceToView(view,0)
    .rightSpaceToView(view,0)
    .topSpaceToView(view,5)
    .heightIs(100);
    
    UIImageView *image_icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 90, 90)];
    [section_view1 addSubview:image_icon];
    NSString *urlstr = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,self.data_obj_info.portrait];
    [image_icon sd_setImageWithURL:[NSURL URLWithString:urlstr]];
    
    image_icon.sd_layout
    .leftSpaceToView(section_view1,5)
    .topSpaceToView(section_view1,10)
    .bottomSpaceToView(section_view1,5)
    .widthIs(90);
    
    // 加载右边文字信息
    
    UIView *view_textinfo = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];
    [section_view1 addSubview:view_textinfo];
    
    ARLabel *title = [[ARLabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    [title setText:self.data_obj_info.name];
    [title setFont:[UIFont systemFontOfSize:15]];
    [view_textinfo addSubview:title];
    
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 25)];
    [address setText:self.data_obj_info.province];
    [address setFont:[UIFont systemFontOfSize:11]];
    [view_textinfo addSubview:address];

    UIView *view_numbg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 25)];
    view_numbg.backgroundColor = [UIColor orangeColor];
    [view_textinfo addSubview:view_numbg];
    
    view_textinfo.sd_layout
    .rightSpaceToView(section_view1,0)
    .topSpaceToView(section_view1,0)
    .bottomSpaceToView(section_view1,0)
    .leftSpaceToView(image_icon,10);
    
    title.sd_layout
    .leftSpaceToView(view_textinfo,5)
    .topSpaceToView(view_textinfo,10)
    .widthIs(200)
    .heightIs(30);
    
    address.sd_layout
    .leftSpaceToView(view_textinfo,5)
    .topSpaceToView(title,10)
    .widthIs(100)
    .heightIs(30);
    
    view_numbg.sd_layout
    .leftSpaceToView(view_textinfo,5)
    .topSpaceToView(title,35)
//    .rightSpaceToView(view_textinfo,10)
    .heightIs(30)
    .widthIs(ScreenWidth*0.7);
    
    char * infocount[] = {"队员:","动态:","粉丝:","人气:"};
    for (int i = 0; i<4; i++)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*view_numbg.frame.size.width/4, 0, view_numbg.frame.size.width/4, view_numbg.frame.size.height)];
        label.text = [NSString stringWithFormat:@"%@%@",@"队员",self.data_obj_info.postcount];
        label.font = [UIFont systemFontOfSize:11];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        [view_numbg addSubview:label];
    }
    // 加载公告 for bottom height 45
    
    UIView *section_view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 5, ScreenWidth, 45)];
    [view addSubview:section_view2];
    
    ARLabel *lb_notice = [[ARLabel alloc] initWithFrame:CGRectMake(30, 5, ScreenWidth-30, 30)];
    lb_notice.text=self.data_obj_info.announce;
    lb_notice.font=[UIFont systemFontOfSize:15];
    [section_view2 addSubview:lb_notice];
    
    
    section_view2.sd_layout
    .leftSpaceToView(view,0)
    .rightSpaceToView(view,0)
    .bottomSpaceToView(view,5)
    .heightIs(45);

    
}

-(void)initSection2:(UIView*)view
{
    view.backgroundColor = [UIColor whiteColor];
    
    UIView *view_title = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    [view addSubview: view_title];

    view_title.sd_layout
    .topSpaceToView(view,0)
    .leftSpaceToView(view,0)
    .rightSpaceToView(view,0)
    .heightIs(40);
    
    // 赛事点评
    
    UILabel *lb_dianping = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 100, view_title.frame.size.height)];
    [lb_dianping setText:@"赛事点评"];
    lb_dianping.textAlignment = NSTextAlignmentCenter;
    [view_title addSubview:lb_dianping];
    
    
}

-(void)initSection3:(UIView*)view
{
    
    char * name[] = {"球队","赛程","资料","球员","排行榜"};
    char * imagename[] = {"bnt_item_team","bnt_item_list","bnt_item_info","bnt_item_player","bnt_item_rank"};

    for (int i = 0;  i < 5 ; i++)
    {
        GameItemBt *bt = [GameItemBt buttonWithType:UIButtonTypeCustom];
        [bt setFrame:CGRectMake(i*ScreenWidth/5, 0, ScreenWidth/5, view.frame.size.height)];
        bt.tag = i;
        [bt setImage:[UIImage imageNamed:[NSString stringWithUTF8String:imagename[i]]] forState:UIControlStateNormal];//给button添加image
        [bt setTitle:[NSString stringWithUTF8String:name[i]] forState:UIControlStateNormal];
        [bt resetMiddle];
        [bt setBackgroundColor:[UIColor whiteColor]];
        [bt addTarget:self action:@selector(bnt_click:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:bt];
        bt.layer.borderWidth = 1;
        bt.layer.borderColor = [[UIColor blackColor] CGColor];
    }
    
}
-(void)bnt_click:(UIButton*)sender
{

    if(self.clickBlock)
        self.clickBlock(sender.tag);
        
        
}

@end
