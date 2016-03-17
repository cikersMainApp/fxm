//
//  MessageModel.h
//  CikersApp
//
//  Created by fxm on 16/1/18.
//  Copyright © 2016年 cikers. All rights reserved.
//

@protocol MessageModelDelegate <NSObject>

@optional

-(void)data_scuess:(id)sender;

@end


#import "BaseApi.h"

@interface MessageModel : BaseApi<BaseApiDelegate>

@property(nonatomic,strong)id<MessageModelDelegate>delegate;
@property(nonatomic,assign)NSInteger *meg_type;

-(void)sendBytype:(NSInteger)type offset:(NSString*)offset;

-(void)sendSocialByoffset:(NSString *)offset;
-(void)parseSocialData:(NSDictionary*)data;

-(void)sendEventByoffset:(NSString*)offset;
-(void)parseEventData:(NSDictionary*)data;

-(void)sendMatchByoffset:(NSString*)offset;
-(void)parseMatchData:(NSDictionary*)data;

-(void)sendSystemByoffset:(NSString*)offset;
-(void)parseSystemData:(NSDictionary*)data;


@end
