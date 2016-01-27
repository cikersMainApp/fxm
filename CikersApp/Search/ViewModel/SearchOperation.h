//
//  SearchOperation.h
//  CikersApp
//
//  Created by fxm on 15/12/22.
//  Copyright © 2015年 cikers. All rights reserved.
//


@protocol SearchOperationDelegate <NSObject>

@optional

-(void)dataRecommed_scuess:(NSMutableArray*)dic;
-(void)dataPlayer_scuess:(id)dic;
-(void)dataTeam_scuess:(id)dic;
-(void)dataTounament_scuess:(id)dic;

@end

#import <Foundation/Foundation.h>
#import "BaseApi.h"
@interface SearchOperation : BaseApi<BaseApiDelegate>

@property(nonatomic,strong)id<SearchOperationDelegate>delegate;

-(void)sendRecommedResult;
-(void)parseRecommed:(NSDictionary*)dic;


-(void)searchPlayerByOffset:(NSInteger)offset keyword:(NSString*)keyword;
-(void)parsePlayer:(NSDictionary*)dic;

-(void)searchTeamByOffset:(NSInteger)offset keyword:(NSString*)keyword sportscat:(NSInteger)type province:(NSString*)province;
-(void)parseTeam:(NSDictionary*)dic;

-(void)searchTounamentByOffset:(NSInteger)offset keyword:(NSString*)keyword province:(NSString*)province;
-(void)parseTounament:(NSDictionary*)dic;


@end
