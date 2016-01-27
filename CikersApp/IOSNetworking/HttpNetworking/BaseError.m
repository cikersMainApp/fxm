//
//  BaseError.m
//  CikersApp
//
//  Created by fxm on 16/1/25.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "BaseError.h"

@implementation BaseError

+(void)showErrorMsg:(NSInteger)code msg:(NSString*)msg clickTryAgain:(void (^)(id))completeBlock
{

    NSString *content;
    switch (code) {
        case 20001:
           content = @"密码错误";
            break;
            
        default:
            break;
    }
    
    
    
    
}

@end
