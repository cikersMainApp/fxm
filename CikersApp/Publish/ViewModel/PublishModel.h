//
//  PublishModel.h
//  CikersApp
//
//  Created by fxm on 16/1/12.
//  Copyright © 2016年 cikers. All rights reserved.
//

@protocol PublishModelDelegate <NSObject>

@optional

-(void)data_publish:(NSDictionary*)dic;
-(void)data_search:(NSMutableArray*)data;

@end


#import <Foundation/Foundation.h>
#import "BaseApi.h"
@interface PublishModel :BaseApi<BaseApiDelegate>

@property(nonatomic,strong)id<PublishModelDelegate>delegate;

-(void)sendBySearch:(NSString*)keyword Searchtype:(NSString*)type;
-(void)parseBySearch:(NSDictionary*)dic;


-(void)sendWikiByPersonal:(NSString*)content images:(NSString*)images marks:(NSString*)marks reftype:(NSString*)reftype redid:(NSNumber*)refid;

-(void)parseWikiPersonal:(NSDictionary*)dic;




@end
