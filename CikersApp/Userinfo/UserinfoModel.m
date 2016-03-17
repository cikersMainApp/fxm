//
//  UserinfoModel.m
//  CikersApp
//
//  Created by fxm on 16/2/29.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "UserinfoModel.h"
#import "DicTags.h"
#import "DicPlayerinfo.h"
#import "RMMapper.h"
#import "DicUserinfo.h"
#import "NSUserDefaults+RMSaveCustomObject.h"
#import "DicTeaminfo.h"
#import "DicGameinfo.h"
#import "DicMatchinfo.h"
@implementation UserinfoModel

-(id)initWithDelegate:(id<BaseApiDelegate>)newDelegate needCommonProcess:(BOOL)need
{

    if (self = [super initWithDelegate:self needCommonProcess:need]) {
        
    }
    
    return self;
}

-(void)finishedWithRequest:(HttpRequest *)request Response:(HttpResponse *)response AndError:(NSError *)error
{
    if([request.apiName isEqual:@"tag"]) [self parseTags:request.userInfo];
    if([request.apiName isEqual:@"tagadd"]) [self parseAddTag:request.userInfo];
    if([request.apiName isEqual:@"tagremove"]) [self parseDelTag:request.userInfo];
    if([request.apiName isEqual:@"team"]) [self parseTeam:request.userInfo];
    if([request.apiName isEqual:@"teamremove"]) [self parseTeamRemove:request.userInfo];
    if([request.apiName isEqual:@"tournament"]) [self parseTournament:request.userInfo];

}

//cloud/game  cloud/team  cloud/player
-(void)sendTagsByid:(NSNumber*)uid
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@tag/cloud/%@/%@",HOST,_tagString,uid];
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:nil httpTag:@"tag"];

}
-(void)parseTags:(NSDictionary*)dic
{

    NSMutableArray *temp_array = [[NSMutableArray alloc] init];
 
    NSArray *data = [dic objectForKey:@"data"];
    
    for (NSDictionary *elem_dic  in data) {
        
        DicTags *elem_tag = [RMMapper objectWithClass:[DicTags class] fromDictionary:elem_dic];
        
        [temp_array addObject:elem_tag];
    }
 
    [self.delegate data_scuess:temp_array];
    
}

-(void)sendAddTagsBytag:(NSString *)tag uid:(NSNumber *)uid
{
    
    [APSProgress showIndicatorView];
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@tag/add/%@/%@",HOST,_tagString,uid];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:tag,@"tag", nil];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:dic httpTag:@"tagadd"];

}
-(void)parseAddTag:(NSDictionary *)dic
{
    [APSProgress hideHUDWithAnimated:YES];
    
    DicUserinfo *userinfo = [[NSUserDefaults standardUserDefaults] rm_customObjectForKey:@"user"];

    
    NSDictionary *data = [dic objectForKey:@"data"];
    
    DicTags *elem_dic = [[DicTags alloc] init];
    
    elem_dic.tag = [data objectForKey:@"tag"];
    elem_dic.count = [data objectForKey:@"tagCount"];
    
    
    DicPlayerinfo *playerinfo = [[DicPlayerinfo alloc] init];
    playerinfo.id = [data objectForKey:@"oid"];
    playerinfo.icon = userinfo.icon;
    
    elem_dic.array_players = [[NSMutableArray alloc] initWithObjects:playerinfo, nil];
    
    NSMutableArray *temp_array = [[NSMutableArray alloc] init];
    [temp_array addObject:elem_dic];
    
    [self.delegate data_scuess:temp_array];
}


-(void)sendDelTagBytag:(NSString*)tag uid:(NSNumber*)uid
{
    [APSProgress showIndicatorView];
    
    NSString *apiUrl=[NSString stringWithFormat:@"%@tag/remove/player/%@",HOST,uid];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:tag,@"tag", nil];
    
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:dic httpTag:@"tagremove"];

}
-(void)parseDelTag:(NSDictionary*)dic
{
    [self.delegate data_delScuess:nil];
}


-(void)sendTeamByid:(NSNumber*)uid
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@team/listbyplayer?pid=%@",HOST,uid];
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:nil httpTag:@"team"];

}
-(void)parseTeam:(NSDictionary*)dic
{

    NSArray *data = [dic objectForKey:@"data"];
    
    NSMutableArray *temparray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *elem_dic in data) {
        
        DicTeaminfo *elem_team = [RMMapper objectWithClass:[DicTeaminfo class] fromDictionary:elem_dic];
        
        [temparray addObject:elem_team];
    }
    
    [self.delegate data_scuess:temparray];
}
-(void)sendTeamRemoveByTeamid:(NSNumber*)uid
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@team/leave/%@",HOST,uid];
    [self sendRequestWithUrl:apiUrl Method:@"POST" AndParams:nil httpTag:@"teamremove"];

    
}
-(void)parseTeamRemove:(NSDictionary*)dic
{
    [self.delegate data_delScuess:nil];
}



-(void)sendTournamentByid:(NSNumber*)uid
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@match/listbyplayer/%@",HOST,uid];
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:nil httpTag:@"tournament"];

}
-(void)parseTournament:(NSDictionary*)dic
{

    NSArray *data = [dic objectForKey:@"data"];
    
    NSMutableArray *temparray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *elem_dic in data) {
        
        NSDictionary *game = [elem_dic objectForKey:@"game"];
        
        DicGameinfo *elem_game = [RMMapper objectWithClass:[DicGameinfo class] fromDictionary:game];
        
        [temparray addObject:elem_game];
        
        NSArray *matches = [elem_dic objectForKey:@"matches"];
        
        elem_game.array_matchs = [[NSMutableArray alloc] init];
        
        for (NSDictionary *elem_match in matches) {
            
            DicMatchinfo *match = [RMMapper objectWithClass:[DicMatchinfo class] fromDictionary:elem_match];
            
            [elem_game.array_matchs addObject:match];
            
            [match dic_exchangData];
        }
        
    }
    
    [self.delegate data_scuess:temparray];
}

static const char * nettype [] = {"pletsbyuser/player","pletsbyuser/team","pletsbyuser/game","pletsfollows/player"};
-(void)sendFollowByid:(NSNumber*)uid type:(NSInteger)type
{
    NSString *apiUrl=[NSString stringWithFormat:@"%@follow/%s/%@",HOSTWEB,nettype[type],uid];
    [self sendRequestWithUrl:apiUrl Method:@"GET" AndParams:nil httpTag:[NSString stringWithUTF8String:nettype[type]]];
    
}
-(void)parseFollow:(NSDictionary*)dic
{

}
//http://newstack.cikers.com:8080/cikersweb/follow/pletsbyuser/player/1511
//http://newstack.cikers.com:8080/cikersweb/follow/pletsbyuser/player/1511

-(void)sendEventByid:(NSNumber*)uid
{

}
-(void)parseEvent:(NSDictionary*)dic
{

}

-(void)sendWikiByid:(NSNumber*)uid
{

}
-(void)parseWiki:(NSDictionary*)dic
{

}


@end
