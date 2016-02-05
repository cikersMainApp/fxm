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

@property(nonatomic,strong)id<WikiModelDelegate>delegate;


-(void)sendListrecommandByoffset:(NSInteger)offset;
-(void)parseListrecommand:(NSDictionary*)dic;

-(void)sendListCikcleByoffset:(NSInteger)offset;
-(void)parseListCikcle:(NSDictionary*)dic;

@end
