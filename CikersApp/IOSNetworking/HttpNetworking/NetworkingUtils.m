//
//  NetworkingUtils.m
//  TestProject
//
//  Created by Wang Xuyang on 2/21/13.
//  Copyright (c) 2013 Pingan. All rights reserved.
//

#import "NetworkingUtils.h"
#import "NSString+CMUtils.h"

@implementation NetworkingUtils

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}


+ (NetworkingUtils *)utils
{
    static dispatch_once_t once;
    static NetworkingUtils *_utils;
    dispatch_once(&once, ^ { _utils = [[NetworkingUtils alloc] init]; });
    return _utils;
}

+ (NSString *)paramsStringWithDictionary:(NSDictionary *)dict
{
    NSMutableString *string = [NSMutableString string];
    for (NSString *key in [dict allKeys]) {
        NSObject *value = [dict objectForKey:key];
        if([value isKindOfClass:[NSString class]])
            [string appendFormat:@"%@=%@&", [key urlEncodedString], [((NSString*)value) urlEncodedString]];
        else
            [string appendFormat:@"%@=%@&", [key urlEncodedString], value];
    }
    
    if([string length] > 0)
        [string deleteCharactersInRange:NSMakeRange([string length] - 1, 1)];
    
    return string;
}

+ (NSDictionary *)paramsDictionaryWithString:(NSString *)string
{
    NSMutableDictionary *queryStringDictionary = [[NSMutableDictionary alloc] init];
    NSArray *urlComponents = [string componentsSeparatedByString:@"&"];
    for (NSString *keyValuePair in urlComponents)
    {
        NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
        NSString *key = [pairComponents objectAtIndex:0];
        NSString *value = [pairComponents objectAtIndex:1];
        //用于url中存在参数值做base64加密的处理，create by xuwei
        if ([pairComponents count]>2) {
            for (int i=2; i<[pairComponents count]; i++) {
                value=[value stringByAppendingString:@"="];
            }
        }
        [queryStringDictionary setObject:value forKey:key];
    }
    return queryStringDictionary;
}

+ (id)jsonFromResponseData:(NSData *)callbackData
{
    if (callbackData)
    {
        return [NSJSONSerialization JSONObjectWithData:callbackData options:NSJSONReadingMutableContainers error:nil];
    }
    return nil;
}

+ (id)jsonFromResponseString:(NSString *)callbackString
{
    if (callbackString)
    {
        return [self jsonFromResponseData:[callbackString dataUsingEncoding:NSUTF8StringEncoding]];
    }
    return nil;
}

@end
