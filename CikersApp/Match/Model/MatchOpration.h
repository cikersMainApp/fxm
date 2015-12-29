//
//  MatchOpration.h
//  CikersApp
//
//  Created by fxm on 15/12/29.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Api.h"

@protocol MatchOprationDelegate <NSObject>

-(void)data_scuess:(id)dic;

@end


@interface MatchOpration : NSObject<BaseApiDelegate>

@property(nonatomic,strong)id<MatchOprationDelegate>delegate;
@property(nonatomic,strong)Api *net_sendApi;


-(void)getDataForAllinfoBymatchid:(NSString *)matchid;
-(void)parseDataForAllinfo:(NSDictionary*)dic;





@end
