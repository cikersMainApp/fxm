//
//  BaseError.h
//  CikersApp
//
//  Created by fxm on 16/1/25.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseError : NSObject

+(void)showErrorMsg:(NSInteger)code  msg:(NSString*)msg clickTryAgain:(void (^)(id obj))completeBlock;

@end
