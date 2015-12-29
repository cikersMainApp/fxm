//
//  NSDictionary+Utils.m
//  WLTProject
//
//  Created by frankfeng on 13-1-21.
//  Copyright (c) 2013年 luojing. All rights reserved.
//

#import "NSDictionary+Utils.h"

@implementation NSDictionary (Utils)

- (NSString *)stringForKey:(id)key
{
    id obj = [self objectForKey:key];
    if (obj != nil) {
        if ([obj isKindOfClass:[NSString class]])
            return (NSString *)obj;
        else if ([obj isKindOfClass:[NSNumber class]])
            return [(NSNumber *)obj stringValue];
        else if ([obj isKindOfClass:[NSNull class]])
            return @"";
    }
    return @"";
}

@end

@implementation NSMutableDictionary (Utils)

@end
