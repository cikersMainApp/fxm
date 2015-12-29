//
//  LoginData.m
//  CikersApp
//
//  Created by fxm on 15/12/20.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "LoginData.h"

@implementation LoginData

+(void)saveValue:(NSString*)value key:(NSString*)key
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    
}

+(NSString*)getValueBykey:(NSString*)key
{
    return  [[NSUserDefaults standardUserDefaults] objectForKey:key];
}


@end
