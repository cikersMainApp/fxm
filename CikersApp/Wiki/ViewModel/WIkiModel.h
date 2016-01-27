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

@end

#import <UIKit/UIKit.h>
#import "BaseApi.h"
@interface WIkiModel :BaseApi <BaseApiDelegate>

@property(nonatomic,strong,readonly)id<WikiModelDelegate>delegate;


-(void)sendListrecommand;
-(void)parseListrecommand:(NSDictionary*)dic;

-(void)sendListCikcle;
-(void)parseListCikcle:(NSDictionary*)dic;

@end
