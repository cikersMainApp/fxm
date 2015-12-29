//
//  HttpRequest.m
//  wlt
//
//  Created by Wang Xuyang on 12/24/12.
//  Copyright (c) 2012 Pingan. All rights reserved.
//

#import "HttpRequest.h"
#import "NSString+CMUtils.h"
#import "NSMutableURLRequest+CMUtils.h"

@interface HttpRequest ()
{
    NSURL *_requestUrl;
    NSMutableURLRequest *_request;
}

@property (nonatomic, copy, readwrite) NSString            *url;
@property (nonatomic, copy, readwrite) NSString            *method;
@property (nonatomic, strong, readwrite) NSDictionary      *params;

@end

@implementation HttpRequest

@synthesize url = url_;
@synthesize method = method_;
@synthesize body = body_;
@synthesize cookie = cookie_;
@synthesize params = params_;
@synthesize headers = headers_;
@synthesize userInfo = userInfo_;
@synthesize identifier = identifier_;
@synthesize apiName = apiName_;

- (id)init
{
    self = [super init];
    if (self) {
        _request = [[NSMutableURLRequest alloc] init];
        
        method_ = [@"GET" copy];
        identifier_ = [DEFAULT_REQUEST_IDENTIFIER copy];
        
        self.apiId = 0;
        
//        [self commonHeaders]; // TODO: change it when coding headers
    }
    return self;
}

- (id)initWithUrl:(NSString *)url method:(NSString *)method params:(NSDictionary *)params
{
    self = [self init];
    if (self) {
        self.url = url;
        self.method = (method ? method : @"GET");
        self.params = params;

        [_request setHTTPMethod:self.method];

        if (self.params) {
            if (self.method && ([self.method isEqualToString:@"POST"] || [self.method isEqualToString:@"PUT"])) {
                [self setBodyWithDictionary:self.params];
            } else {
                [self setQuerystringWithDictionary:self.params];
            }
        }
    }
    return self;
}


- (void)dealloc
{
     url_ = nil;
     self.method = nil;
     cookie_ = nil;
     self.params = nil;
    
     _requestUrl = nil;
     _request = nil;
    
    
}

#pragma mark - accessor

- (NSURLRequest *)request
{
    return _request;
}

- (void)setUrl:(NSString *)url
{
    url_ = [url copy];

    if (_requestUrl) {
        _requestUrl = nil;
    }
    _requestUrl = [[NSURL alloc] initWithString:url_];
    [_request setURL:_requestUrl];
}

- (void)setBody:(NSMutableData *)body
{
    body_ = [body copy];

    if ([self needBody]) {
        NSString *strLength = [NSString stringWithFormat:@"%d", [body_ length]];
        [_request setValue:strLength forHTTPHeaderField:@"Content-Length"];
        [_request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [_request setValue:@"https://ipcrs.pbccrc.org.cn/" forHTTPHeaderField:@"Referer"];
        [_request setHTTPBody:body_];
    }
}

- (void)setCookie:(NSString *)cookie
{
    cookie_ = [cookie copy];

    [_request setCookieWithString:cookie_];
}

- (void)setHeaders:(NSDictionary *)headers
{
    headers_ = headers;
    
    [self setHeaderWithDictionary:headers_];
}

- (void)setTimeoutInterval:(NSTimeInterval)interval
{
    [_request setTimeoutInterval:interval];
}

#pragma mark - querystring

/// 传入的新querystring将会和url字符串里已经存在的querystring合并并修改url属性
- (void)setQuerystringWithString:(NSString *)stringQuery
{
    NSDictionary *dict = [self dictionaryWithQuerystring:stringQuery];
    [self setQuerystringWithDictionary:dict];
}

/// 传入的新参数字典将会和url字符串里已经存在的querystring合并并转成字符串后修改url属性
- (void)setQuerystringWithDictionary:(NSDictionary *)dictQuery
{
    if (!dictQuery) return;
    NSString *querstring = _requestUrl.query ? _requestUrl.query : @"";
    NSDictionary *newDict = [self dictionaryWithQuerystring:querstring];
    for (NSString *k in dictQuery.allKeys) {
        NSString *v = [dictQuery objectForKey:k];
        [newDict setValue:v forKey:k];
    }
    NSString *newQuerystring = [self querystringWithDictionary:newDict];
    NSString *urlWithoutQuerystring = [self.url stringByReplacingOccurrencesOfString:querstring withString:@""];
    urlWithoutQuerystring = [urlWithoutQuerystring stringByReplacingOccurrencesOfString:@"?" withString:@""];
    self.url = [NSString stringWithFormat:@"%@?%@", urlWithoutQuerystring, newQuerystring];
}

#pragma mark - body

- (void)setBodyWithString:(NSString *)stringBody
{
    NSMutableData *bodyFromString = [NSMutableData data];
    stringBody=[stringBody urlDecodedString];
    NSStringEncoding enc =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    [bodyFromString appendData:[stringBody dataUsingEncoding:enc]];
//    [bodyFromString appendData:[stringBody dataUsingEncoding:NSUTF8StringEncoding]];
    self.body = bodyFromString;
}

- (void)setBodyWithDictionary:(NSDictionary *)dictBody
{
    [self setBodyWithString:[self querystringWithDictionary:dictBody]];
}

- (NSString *)bodyString
{
    return [[NSString alloc] initWithData:self.body
                                  encoding:NSUTF8StringEncoding];
}

#pragma mark - cookie

- (void)setCookieWithDictionary:(NSDictionary *)dictCookies
{
    self.cookie = [self cookieStringWithDictionary:dictCookies];
}

- (void)setCookieWithCookiesArray:(NSArray *)arrCookies;
{
    self.cookie = [self cookieStringWithCookiesArray:arrCookies];
}

- (NSDictionary *)cookieDict
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSArray *kvs = [cookie_ componentsSeparatedByString:@"; "];
    for (NSString *kv in kvs) {
        NSArray *arrKV = [kv componentsSeparatedByString:@"="];
        if ([arrKV count] < 2) {
            continue;
        }
        NSString *key = [[arrKV objectAtIndex:0] urlDecodedString];
        NSString *value = [[arrKV objectAtIndex:1] urlDecodedString];
        [dict setObject:value forKey:key];
    }
    return dict;
}

#pragma mark - header

- (void)setHeaderWithDictionary:(NSDictionary *)dictHeaders
{
    if (!dictHeaders) return;
    [_request setAllHTTPHeaderFields:dictHeaders];
    //NSLog(@"请求包头: %@", [_request allHTTPHeaderFields]);
}

#pragma mark - basic auth

- (void)setBasicAuthWithUsername:(NSString *)username AndPassword:(NSString *)password
{
    NSString *authStr = [NSString stringWithFormat:@"%@:%@", username, password];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authStr base64String]];
    [_request setValue:authValue forHTTPHeaderField:@"Authorization"];
}


#pragma mark - private type convert

- (NSString *)querystringWithDictionary:(NSDictionary *)dict
{
    if (!dict) return @"";
    NSMutableString *string = [NSMutableString string];
    for (NSString *key in [dict allKeys]) {
        NSObject *value = [dict objectForKey:key];
        if([value isKindOfClass:[NSString class]]){
            [string appendFormat:@"%@=%@&", key, [(NSString *)value urlEncodedString]];
        }
        else
            [string appendFormat:@"%@=%@&", [key urlEncodedString], value];
    }
    if([string length] > 0)
        [string deleteCharactersInRange:NSMakeRange([string length] - 1, 1)];
    
    return string;
}

- (NSDictionary *)dictionaryWithQuerystring:(NSString *)string
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    string = [string stringByReplacingOccurrencesOfString:@"?" withString:@""];
    NSArray *kvs = [string componentsSeparatedByString:@"&"];
    for (NSString *kv in kvs) {
        NSArray *arrKV = [kv componentsSeparatedByString:@"="];
        if ([arrKV count] < 2) {
            continue;
        }
        NSString *key = [[arrKV objectAtIndex:0] urlDecodedString];
        NSString *value = [[arrKV objectAtIndex:1] urlDecodedString];
        [dict setObject:value forKey:key];
    }
    return dict;
}

- (NSString *)cookieStringWithDictionary:(NSDictionary *)dict
{
    NSMutableString *string = [NSMutableString string];
    for (NSString *key in [dict allKeys]) {
        NSObject *value = [dict objectForKey:key];
        if([value isKindOfClass:[NSString class]])
            [string appendFormat:@"%@=%@; ", [key urlEncodedString], [((NSString*)value) urlEncodedString]];
        else
            [string appendFormat:@"%@=%@; ", [key urlEncodedString], value];
    }
    
    if([string length] > 0)
        [string deleteCharactersInRange:NSMakeRange([string length] - 2, 2)];
    
    return string;
}

- (NSString *)cookieStringWithCookiesArray:(NSArray *)arrCookies
{
    NSDictionary *header = [NSHTTPCookie requestHeaderFieldsWithCookies:arrCookies];
    return [header objectForKey:@"Cookie"];
}

#pragma mark - private methods

- (BOOL)needBody
{
    return (body_
            && self.method
            && ([self.method isEqualToString:@"POST"]
                || [self.method isEqualToString:@"PUT"]));
}

- (void)commonHeaders
{
    //    POST /path HTTP/1.1
    //    Host: www.myhostname.com
    //    User-Agent: Mozilla/5.0 [...etc...]
    //    Accept: text/html,application/xhtml+xml, [...etc...]
    //    Accept-Language: en-gb,en;q=0.5
    //    Accept-Encoding: gzip,deflate
    //    Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7
    //    Keep-Alive: 300
    //    Connection: keep-alive
    //    Content-Type: application/x-www-form-urlencoded
    //    Content-Length: 41
    
    [_request setValue:@"CMNetworking" forHTTPHeaderField:@"User-Agent"];
    [_request setValue:@"text/html,application/xhtml+xml,application/json" forHTTPHeaderField:@"Accept"];
    [_request setValue:@"ISO-8859-1,utf-8;q=0.7,*;q=0.7" forHTTPHeaderField:@"Accept-Charset"];
    
    //    [_request setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
    //    [_request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [_request setValue:@"application/x-www-form-urlencoded; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    //    @"application/json; charset=UTF-8"
    //    @"application/x-plist; charset=UTF-8"
}

@end
