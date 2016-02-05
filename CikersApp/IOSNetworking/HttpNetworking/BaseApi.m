//
//  BaseApi.m
//  TestProject
//
//  Created by Wang Xuyang on 2/21/13.
//  Copyright (c) 2013 Pingan. All rights reserved.
//

#import "BaseApi.h"
#import "CommonCallback.h"
#import "AppDelegate.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import "BaseError.h"
@interface BaseApi()
@property (nonatomic,strong) CommonCallback * callbackDelegate;
@end

@implementation BaseApi

@synthesize httpdelegate = _httpdelegate;
@synthesize httpDispatcher = _httpDispatcher;

- (id)initWithDelegate:(id<BaseApiDelegate,CommonCallbackDelegate>)newDelegate needCommonProcess:(BOOL) need
{
    self = [super init];
    if (self) {
        if (need) {
            self.callbackDelegate = [[CommonCallback alloc] init];
            self.callbackDelegate.delegate = newDelegate;
            self.httpdelegate = self.callbackDelegate;
        }
        else
        {
            self.httpdelegate = newDelegate;
        }
        
        _httpDispatcher = [[HttpDispatcher alloc] initConcurrentQueue];
    }
    return self;
}

- (void)dealloc
{
    _httpdelegate = nil;
}

-(void)setHeader:(NSDictionary *)dic
{

}

#pragma mark - common

-(NSArray *)getCookie:(HttpRequest *)req
{
    NSArray *cookies=[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
    NSMutableArray *array=[[NSMutableArray alloc] init];
    for (int i=0; i<[cookies count]; i++) {
        NSHTTPCookie *cookie=[cookies objectAtIndex:i];
        if ([req.url containsString:cookie.domain]) {
            [array addObject:[cookies objectAtIndex:i]];
        }
    }
    return array;
}


-(void)sendRequestWithUrl:(NSString *)apiUrl Method:(NSString *)method AndParams:(NSDictionary *)paramsDict httpTag:(NSString *)tag header:(NSInteger)type
{

    HttpRequest *request = [[HttpRequest alloc] initWithUrl:apiUrl method:method params:nil];
    request.identifier = request.url;
    request.apiName = tag;
    
    
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    [dic setValue:@"application/json" forKey:@"Content-Type"];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"login"])
    {
        
        NSNumber *uid = [[NSUserDefaults standardUserDefaults] objectForKey:@"userid"];
        
//        [dic setValue:[NSString stringWithFormat:@"PID_%@",uid] forKey:@"_CIKERS_KEY_"];
        
    }

    [request setBodyWithString:[paramsDict objectForKey:@"data"]];
    [request setHeaderWithDictionary:dic];
    
    [self sendRequest:request];
    
}

- (void)sendRequestWithUrl:(NSString *)apiUrl Method:(NSString *)method AndParams:(NSDictionary *)paramsDict httpTag:(NSString *)tag
{
    HttpRequest *req = [[HttpRequest alloc] initWithUrl:apiUrl method:method params:paramsDict];
    req.identifier = req.url;
    req.apiName=tag;
    [req setTimeoutInterval:30];
    [req setCookieWithCookiesArray:[self getCookie:req]];
    
    if (req.params) {
        if (req.method && ([req.method isEqualToString:@"POST"] || [req.method isEqualToString:@"PUT"])) {
            
            [req setBodyWithDictionary:req.params];

        } else {
            [req setQuerystringWithDictionary:req.params];
        }
    }
    
    [self sendRequest:req];

}

- (void)sendRequestWithUrl:(NSString *)apiUrl Method:(NSString *)method AndParams:(NSDictionary *)paramsDict
{
    
    HttpRequest *req = [[HttpRequest alloc] initWithUrl:apiUrl method:method params:paramsDict];
    req.identifier = req.url;
    if (req.params) {
        if (req.method && ([req.method isEqualToString:@"POST"] || [req.method isEqualToString:@"PUT"])) {
            
            [req setBodyWithDictionary:req.params];
            
        } else {
            [req setQuerystringWithDictionary:req.params];
        }
    }
    [self sendRequest:req];
}
/*
 e:
 data:
 total:
 msg:
 
 */
- (void)sendRequest:(HttpRequest *)req
{   
    NSLog(@"请求API的url是：%@ method:%@ params:%@ header:%@", req.url, req.method, req.params, req.request.allHTTPHeaderFields);
    [_httpDispatcher enqueueRquest:req WithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (self.httpdelegate && [self.httpdelegate respondsToSelector:@selector(finishedWithRequest:Response:AndError:)]) {
            HttpResponse * rsp = [[HttpResponse alloc] init];
            rsp.response = operation.response;
            rsp.responseData = operation.responseData;
            rsp.responseString = operation.responseString;
            
            
            
            HttpRequest *request = req;
            
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:rsp.responseData options:NSJSONReadingAllowFragments error:nil];
            
            request.userInfo = dic;
            
            NSLog(@"%@",dic);
            
            NSObject *e = [dic objectForKey:@"e"];
            
            int json_e = [(NSNumber*)e intValue];
            
            if (json_e != 0)
            {
                
                [APSProgress hidenIndicatorView];
                
                [APSProgress showHUDAddedTo:[DataSingleton Instance].curVC.view message:[dic objectForKey:@"msg"] animated:YES];
                
                return;
            }
            
            
            [self.httpdelegate finishedWithRequest:request Response:rsp AndError:nil];
            
            [APSProgress hidenIndicatorView];

        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (self.httpdelegate && [self.httpdelegate respondsToSelector:@selector(finishedWithRequest:Response:AndError:)]) {
            HttpResponse * rsp = [[HttpResponse alloc] init];
            rsp.response = operation.response;
            rsp.responseData = operation.responseData;
            rsp.responseString = operation.responseString;
            
            
            [APSProgress hideHUDWithAnimated:YES];
            
            [APSProgress showToast:nil withMessage:@"网络不畅"];

//            [self.httpdelegate finishedWithRequest:req Response:rsp AndError:nil];

//            [self.httpdelegate finishedFail:error Request:req Response:rsp];
            
            NSLog(@"++++++++++++++++++++++++++++++++++");
            NSLog(@"===================网络不畅");
            NSLog(@"===================%@",error);
            NSLog(@"++++++++++++++++++++++++++++++++++");
            
            if (error.code == -1001)
            {
                NSLog(@"+++++++++++++++++++++请求超时");
            }
            
            NSLog(@"++++++++++++++++++++++++++++++++++");

        }
        
    }];
}


+(NSString*)GetNetWorkType
{
    NSString* strNetworkType = @"";
    
    //创建零地址，0.0.0.0的地址表示查询本机的网络连接状态
    struct sockaddr_storage zeroAddress;
    
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.ss_len = sizeof(zeroAddress);
    zeroAddress.ss_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    //获得连接的标志
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    //如果不能获取连接标志，则不能连接网络，直接返回
    if (!didRetrieveFlags)
    {
        return strNetworkType;
    }
    
    if ((flags & kSCNetworkReachabilityFlagsConnectionRequired) == 0)
    {
        // if target host is reachable and no connection is required
        // then we'll assume (for now) that your on Wi-Fi
        strNetworkType = @"WIFI";
    }
    
    if (
        ((flags & kSCNetworkReachabilityFlagsConnectionOnDemand ) != 0) ||
        (flags & kSCNetworkReachabilityFlagsConnectionOnTraffic) != 0
        )
    {
        // ... and the connection is on-demand (or on-traffic) if the
        // calling application is using the CFSocketStream or higher APIs
        if ((flags & kSCNetworkReachabilityFlagsInterventionRequired) == 0)
        {
            // ... and no [user] intervention is needed
            strNetworkType = @"WIFI";
        }
    }
    
    if ((flags & kSCNetworkReachabilityFlagsIsWWAN) == kSCNetworkReachabilityFlagsIsWWAN)
    {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
        {
            CTTelephonyNetworkInfo * info = [[CTTelephonyNetworkInfo alloc] init];
            NSString *currentRadioAccessTechnology = info.currentRadioAccessTechnology;
            
            if (currentRadioAccessTechnology)
            {
                if ([currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyLTE])
                {
                    strNetworkType =  @"4G";
                }
                else if ([currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyEdge] || [currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyGPRS])
                {
                    strNetworkType =  @"2G";
                }
                else
                {
                    strNetworkType =  @"3G";
                }
            }
        }
        else
        {
            if((flags & kSCNetworkReachabilityFlagsReachable) == kSCNetworkReachabilityFlagsReachable)
            {
                if ((flags & kSCNetworkReachabilityFlagsTransientConnection) == kSCNetworkReachabilityFlagsTransientConnection)
                {
                    if((flags & kSCNetworkReachabilityFlagsConnectionRequired) == kSCNetworkReachabilityFlagsConnectionRequired)
                    {
                        strNetworkType = @"2G";
                    }
                    else
                    {
                        strNetworkType = @"3G";
                    }
                }
            }
        }
    }
    
    
    if ([strNetworkType isEqual:@""]) {
        strNetworkType = @"WWAN";
    }
    
    NSLog( @"GetNetWorkType() strNetworkType :  %@", strNetworkType);
    
    return strNetworkType;
}

@end
