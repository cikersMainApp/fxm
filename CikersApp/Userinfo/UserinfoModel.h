//
//  UserinfoModel.h
//  CikersApp
//
//  Created by fxm on 16/2/29.
//  Copyright © 2016年 cikers. All rights reserved.
//

@protocol UserinfoModelDelegate <NSObject>

@optional

-(void)data_scuess:(id)obj;
-(void)data_delScuess:(id)obj;
-(void)data_support:(id)obj;

@end


#import "BaseApi.h"

@interface UserinfoModel : BaseApi<BaseApiDelegate>

@property(nonatomic,strong)id<UserinfoModelDelegate>delegate;
@property(nonatomic,strong)NSString *tagString;



-(void)sendTagsByid:(NSNumber*)uid;
-(void)parseTags:(NSDictionary*)dic;

-(void)sendAddTagsBytag:(NSString*)tag uid:(NSNumber*)uid;
-(void)parseAddTag:(NSDictionary*)dic;

-(void)sendDelTagBytag:(NSString*)tag uid:(NSNumber*)uid;
-(void)parseDelTag:(NSDictionary*)dic;



-(void)sendTeamByid:(NSNumber*)uid;
-(void)parseTeam:(NSDictionary*)dic;

-(void)sendTeamRemoveByTeamid:(NSNumber*)uid;
-(void)parseTeamRemove:(NSDictionary*)dic;


-(void)sendTournamentByid:(NSNumber*)uid;
-(void)parseTournament:(NSDictionary*)dic;

-(void)sendEventByid:(NSNumber*)uid;
-(void)parseEvent:(NSDictionary*)dic;

-(void)sendWikiByid:(NSNumber*)uid;
-(void)parseWiki:(NSDictionary*)dic;

-(void)sendFollowByid:(NSNumber*)uid type:(NSInteger)type;
-(void)parseFollow:(NSDictionary*)dic;


@end
