//
//  TounamentView.m
//  CikersApp
//
//  Created by fxm on 16/1/18.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "TounamentView.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "GameTeamVC.h"
#import "GameInfoVC.h"
#import "GamelistTableVC.h"
#import "BntLImageRTitle.h"
#import "DicTags.h"
@implementation TounamentView

-(void)updateUI:(DicGameinfo *)dic
{
    NSString *urlstr = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,dic.portrait];
    [_img_icon sd_setImageWithURL:[NSURL URLWithString:urlstr]];

    _lb_name.text = dic.name;
    _lb_address.text = dic.province;
    _lb_note.text = dic.announce;
    
    
    //describe 由四部分组成
    
    NSString *str_exchange = [NSString stringWithFormat:
                              @"球队%@  |  动态%@  |  粉丝%@  |  人气%@",
                              dic.teamcount,
                              dic.viewcount,
                              dic.followcount,
                              @""];
    _lb_describe.text = str_exchange;
    
    
    [self initBnts];
    
    _bt_singup.backgroundColor = COLOR_BNT_Orange;
    _bt_singup.layer.cornerRadius = 10;
    _bt_singup.layer.masksToBounds = YES;
    [_bt_singup setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
}

-(IBAction)bnt_singup:(id)sender
{

    self.clickSingupBlock(sender);
    
}


/*
 0 1
 2 3
 4 5
 */

const char * titlename[] = {"全部球队","比赛赛程","详细资料","活动动态","联赛排名","球员榜单"};
const char * titleimage[]= {"icon_bt_team","icon_bt_list","icon_bt_info","icon_bt_wiki","icon_bt_rank","icon_bt_players"};
#define COLOR_FEN [UIColor colorWithRed:255.0f/255.0f green:102.0f/255.0f blue:152.0f/255.0f alpha:1]
#define COLOR_LAN [UIColor colorWithRed:39.0f/255.0f green:155.0f/255.0f blue:247.0f/255.0f alpha:1]
#define COLOR_CHENG [UIColor colorWithRed:255.0f/255.0f green:151.0f/255.0f blue:72.0f/255.0f alpha:1]
#define COLOR_FEN_QIAN [UIColor colorWithRed:208.0f/255.0f green:103.0f/255.0f blue:198.0f/255.0f alpha:1]
#define COLOR_ZI [UIColor colorWithRed:111.0f/255.0f green:89.0f/255.0f blue:155.0f/255.0f alpha:1]
#define COLOR_LV_QIAN [UIColor colorWithRed:122.0f/255.0f green:180.0f/255.0f blue:92.0f/255.0f alpha:1]
-(void)initBnts
{
 
    
    
    
    NSMutableArray *array_color = [[NSMutableArray alloc] init];
    [array_color addObject:COLOR_FEN];
    [array_color addObject:COLOR_LAN];
    [array_color addObject:COLOR_CHENG];
    [array_color addObject:COLOR_FEN_QIAN];
    [array_color addObject:COLOR_ZI];
    [array_color addObject:COLOR_LV_QIAN];
    
    
    float offsety = -1;
    float offsetx = 0;
    for (int i = 0; i<6; i++)
    {

        offsetx = (i%2 == 0)?-0.5:ScreenWidth/2-0.5;
        
        
        BntLImageRTitle *bt = [BntLImageRTitle buttonWithType:UIButtonTypeCustom];
        [bt setTitle:[NSString stringWithUTF8String:titlename[i]] forState:UIControlStateNormal];
        [bt setFrame:CGRectMake(offsetx, offsety, ScreenWidth/2+0.5, 60)];
        [bt setBackgroundColor:[UIColor whiteColor]];
        bt.tag = i;
        [bt addTarget:self action:@selector(bnt_item_click:) forControlEvents:UIControlEventTouchUpInside];
        [_view_bnts addSubview:bt];
        
        [bt setImage:[UIImage imageNamed:[NSString stringWithUTF8String:titleimage[i]]] forState:UIControlStateNormal];

        [bt setTitleColor:[array_color objectAtIndex:i] forState:UIControlStateNormal];
        
        offsety = (i%2 == 1)?offsety+60+1:offsety;
        
        /*
        bt.adjustsImageWhenHighlighted = NO;
        bt.layer.borderWidth = 0.5;
        bt.layer.borderColor = [[UIColor grayColor] CGColor];
        */

        
    }
    
    UIView *view_h = [[UIView alloc] init];
    [view_h setFrame:CGRectMake(ScreenWidth/2, 0, 1, 182)];
    [view_h setBackgroundColor:[UIColor grayColor]];
    [_view_bnts addSubview:view_h];
    
    for (int i = 0; i<3; i++) {
        
        UIView *view = [[UIView alloc] init];
        [view setFrame:CGRectMake(0, 60 + i*60, ScreenWidth, 1)];
        [view setBackgroundColor:[UIColor grayColor]];
        [_view_bnts addSubview:view];
        
        
    }
    
    
}

-(void)bnt_item_click:(UIButton*)clicktag
{
    self.clickBlock(clicktag.tag);
}


-(void)updateTagsUI:(NSArray *)dic
{
    
    
    if ([dic count] == 0) {

        
        UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _view_tags.frame.size.width, _view_tags.frame.size.height)];
        lb.text = @"暂无新标签";
        [_view_tags addSubview:lb];
        lb.textAlignment = NSTextAlignmentCenter;
        
        
        
//        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
//        [bt setFrame:CGRectMake(0, 0, _view_tags.frame.size.width/2, _view_tags.frame.size.height)];
//        [bt setTitle:@"暂无新标签" forState:UIControlStateNormal];
//        [_view_tags addSubview:bt];
    }
    else
    {
        [self creatTags:dic];
    }

}

-(void)creatTags:(NSArray*)array
{
    float offsetx = 0;
    float offsety = 0;
    
    for (int i = 0; i<[array count]; i++)
    {
        
        DicTags *dic_tags = [array objectAtIndex:i];
        
        
        offsetx = (i%2 == 0)?0:0+ScreenWidth/2;
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(offsetx, offsety, ScreenWidth/2, _view_tags.frame.size.height/2)];
        [_view_tags addSubview:view];
        
        UILabel *left = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
        left.textAlignment = NSTextAlignmentLeft;
        
        [view addSubview:left];
        
        
        
        UILabel *right = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
        right.textAlignment = NSTextAlignmentRight;
        [view addSubview:right];
        
        
        left.text = dic_tags.tag;
        right.text= [NSString stringWithFormat:@"%@",dic_tags.count];
        
        right.textColor = [UIColor orangeColor];
        
        offsety = (i%2 == 1)?offsety+_view_tags.frame.size.height/2:offsety;
        
    }
    
}

@end


