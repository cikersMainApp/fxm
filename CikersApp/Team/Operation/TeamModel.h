//
//  TeamModel.h
//  CikersApp
//
//  Created by fxm on 16/1/22.
//  Copyright © 2016年 cikers. All rights reserved.
//

@protocol TeamModeDelegate <NSObject>

@optional

-(void)dataInfo_scuess:(id)dic;
-(void)dataTags_scuess:(id)dic;
-(void)dataPlayer_scuess:(id)dic;
@end

#import <Foundation/Foundation.h>
#import "BaseApi.h"
@interface TeamModel :BaseApi<BaseApiDelegate>

@property(nonatomic,strong)id<TeamModeDelegate>delegate;

-(void)sendInfo:(NSNumber *)teamid;
-(void)parseInfo:(NSDictionary*)dic;

-(void)sendTags:(NSNumber*)teamid;
-(void)parseTags:(NSDictionary*)dic;

-(void)sendPlayer:(NSNumber*)teamid;
-(void)parsePlayer:(NSDictionary*)dic;
@end
