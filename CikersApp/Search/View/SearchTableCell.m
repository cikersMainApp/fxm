//
//  SearchTableCell.m
//  CikersApp
//
//  Created by fxm on 15/12/21.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "SearchTableCell.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "AppDelegate.h"
#import "SearchVC.h"
#import "HLNavgationController.h"
@implementation SearchTableCell

- (void)awakeFromNib {
    // Initialization code
}



-(void)initUI
{
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-1, ScreenWidth, 1)];
    [line setBackgroundColor:[UIColor blackColor]];
    [self addSubview:line];
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)updataContent:(NSDictionary*)dic type:(NSInteger)type
{

    switch ([DataSingleton Instance].viewType) {
        case VIEW_SEARCH_TEAM:
        {
            [self updateForteam:dic];
        }
            break;
        case VIEW_SEARCH_GAME:
        {
            [self updateForgame:dic];
        }
            break;
        case VIEW_SEARCH_PLAYER:
        {
            [self updateForplayer:dic];
        }
            break;
        default:
            break;
    }

    
    
}

-(void)updateForgame:(NSDictionary *)dic
{

    self.view_player.hidden = YES;
    self.view_game.hidden = NO;
    
    NSString * name = [dic objectForKey:@"field1"];
    NSString * url = [dic objectForKey:@"field2"];
    self.eventId = [dic objectForKey:@"oid"];
    

    [self.img_gameIcon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.cikers.com%@",url]]];
    
    [self.lb_gameName setText:name];
    
    [self.lb_gameInfo setText:@"参赛队数"];
    
}

-(void)updateForteam:(NSDictionary *)dic
{
    self.view_player.hidden = YES;
    self.view_game.hidden = NO;

    NSString * name = [dic objectForKey:@"field1"];
    NSString * url = [dic objectForKey:@"field2"];
    self.eventId = [dic objectForKey:@"oid"];
    
    
    [self.img_gameIcon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.cikers.com%@",url]]];
    
    [self.lb_gameName setText:name];
    
    [self.lb_gameInfo setText:@"球队人数"];
    
}

-(void)updateForplayer:(NSDictionary *)dic
{
    self.view_player.hidden = NO;
    self.view_game.hidden = YES;
    
    NSString * name = [dic objectForKey:@"field1"];
    NSString * url = [dic objectForKey:@"field2"];
    self.eventId = [dic objectForKey:@"oid"];
    
    
    [self.img_playerIcon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.cikers.com%@",url]]];
    
    [self.lb_playerName setText:name];
    
    [self.lb_playerInfo setText:@"我参加的队伍"];
}


-(IBAction)bnt_click:(id)sender
{

    UIButton *bt = (UIButton*)sender;
    
    NSLog(@"id:%d",(int)bt.tag);
    
    switch ([DataSingleton Instance].viewType) {
        case VIEW_SEARCH_TEAM:
        {
            [DataSingleton Instance].id_search_team = self.eventId;
            [AppDelegate setTeamRoot];
        }
            break;
        case VIEW_SEARCH_GAME:
        {
            [DataSingleton Instance].id_search_game = self.eventId;
            [AppDelegate setGameRoot];
            
        }
            break;
        case VIEW_SEARCH_PLAYER:
        {
            [DataSingleton Instance].id_search_player = self.eventId;
            
        }
            break;
        default:
            break;
    }

}

@end
