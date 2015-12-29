//
//  LoginData.h
//  CikersApp
//
//  Created by fxm on 15/12/20.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginData : NSObject

+(void)saveValue:(NSString*)value key:(NSString*)key;

+(NSString*)getValueBykey:(NSString*)key;

@end
