//
//  HttpRequest.h
//  wlt
//
//  这个类主要用以简化拼装NSURLRequest对象的工作
//  另外还给request扩展一些并发执行调度时需要的信息
//
//  Created by Wang Xuyang on 12/24/12.
//  Copyright (c) 2012 Pingan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpConstants.h"

@interface HttpRequest : NSObject

@property (nonatomic, copy, readonly) NSString            *url;
@property (nonatomic, copy, readonly) NSString            *method;
@property (nonatomic, copy) NSData              *body;
@property (nonatomic, copy) NSString            *cookie;
@property (nonatomic, strong, readonly) NSDictionary      *params;
@property (nonatomic, strong) NSDictionary      *headers;
@property (nonatomic, strong) NSDictionary      *userInfo;
@property int apiId;    //接口ID
@property (nonatomic, copy) NSString * apiName;

@property (nonatomic, readonly, strong) NSURLRequest    *request;

@property (nonatomic, copy)     NSString *  identifier;

/// 实例化HttpClient
/// 传入一个*完整的*URL字符串，如：http://www.baidu.com
- (id)initWithUrl:(NSString *)url method:(NSString *)method params:(NSDictionary *)params;

/// 设置超时时间
- (void)setTimeoutInterval:(NSTimeInterval)interval;

/// 设置Cookie（字典）
- (void)setCookieWithDictionary:(NSDictionary *)dictCookies;
/// 设置Cookie（HTTPCookie数组）
- (void)setCookieWithCookiesArray:(NSArray *)arrCookies;
/// 获取Cookie (字典)
- (NSDictionary *)cookieDict;

/// 设置Basic Authentication
- (void)setBasicAuthWithUsername:(NSString *)username AndPassword:(NSString *)password;

/// 返回NSString类型的body
- (NSString *)bodyString;

@end
