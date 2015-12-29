//
//  CommonCallback.m
//  NetApi
//
//  Created by administrater on 15/11/18.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "CommonCallback.h"

@implementation CommonCallback

- (void)finishedWithRequest:(HttpRequest *)request
                   Response:(HttpResponse *)response
                   AndError:(NSError *)error
{
    //    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:response.response options:NSJSONReadingAllowFragments error:&error];
    [self.delegate callbackResult:response];
}

@end
