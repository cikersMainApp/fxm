//
//  NetworkingUtils.h
//  TestProject
//
//  Created by Wang Xuyang on 2/21/13.
//  Copyright (c) 2013 Pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkingUtils : NSObject

+ (NetworkingUtils *)utils;

/// 从参数字段转换到key=value&foo=bar的字串（可用在querystring或body）
+ (NSString *)paramsStringWithDictionary:(NSDictionary *)dict;
/// 从key=value&foo=bar的字串转换到字典
+ (NSDictionary *)paramsDictionaryWithString:(NSString *)string;

/// parse服务器返回的json的NSData到NSDictionary（或NSArray）
+ (id)jsonFromResponseData:(NSData *)callbackData;

/// parse服务器返回的json的NSString到NSDictionary（或NSArray）
+ (id)jsonFromResponseString:(NSString *)callbackString;

@end
