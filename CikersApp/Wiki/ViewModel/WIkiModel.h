//
//  WIkiModel.h
//  CikersApp
//
//  Created by fxm on 16/1/5.
//  Copyright © 2016年 cikers. All rights reserved.
//

@protocol WikiModelDelegate <NSObject>

@optional

-(void)data_scuess:(NSMutableArray*)dic;

-(void)data_info:(id)dic;

@end

#import <UIKit/UIKit.h>
#import "BaseApi.h"
@interface WIkiModel :BaseApi <BaseApiDelegate>

@property(nonatomic,strong)id<WikiModelDelegate>delegate;


-(void)sendHotFavor:(NSNumber*)uid;
-(void)parseHotFavor:(NSDictionary*)dic;

-(void)sendWikiInfo:(NSNumber*)uid;
-(void)parseWikiInfo:(NSDictionary*)dic;


-(void)sendListrecommandByoffset:(NSInteger)offset;
-(void)parseListrecommand:(NSDictionary*)dic;

-(void)sendListCikcleByoffset:(NSInteger)offset;
-(void)parseListCikcle:(NSDictionary*)dic;

-(void)sendZhuanqu;
-(void)parseZhuanqu:(NSDictionary*)dic;

@end
