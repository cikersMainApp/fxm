//
//  DataSingleton.m
//  CikersApp
//
//  Created by fxm on 15/12/23.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "DataSingleton.h"

@implementation DataSingleton

static DataSingleton *sharedAccountManagerInstance = nil;

+ (DataSingleton *)Instance
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}
@end
