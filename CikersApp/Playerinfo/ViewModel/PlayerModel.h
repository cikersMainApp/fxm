//
//  PlayerModel.h
//  CikersApp
//
//  Created by fxm on 16/1/26.
//  Copyright © 2016年 cikers. All rights reserved.
//

@protocol PlayerModelDelegate <NSObject>

@optional

-(void)datainfo_scuess:(id)dic;
-(void)dataTags_scuess:(id)dic;
@end


#import "BaseApi.h"

@interface PlayerModel : BaseApi<BaseApiDelegate>

@property(nonatomic,weak)id<PlayerModelDelegate>delegate;

-(void)sendInfoByid:(NSNumber*)playerid;
-(void)parseInfo:(NSDictionary*)dic;

-(void)sendTagsByid:(NSNumber*)playerid;
-(void)parseTags:(NSDictionary*)dic;

@end
