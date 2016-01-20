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

- (void)sendRequestWithUrl:(NSString *)apiUrl Method:(NSString *)method AndParams:(NSDictionary *)paramsDict httpTag:(NSString *)tag
{
    HttpRequest *req = [[HttpRequest alloc] initWithUrl:apiUrl method:method params:paramsDict];
    req.identifier = req.url;
    req.apiName=tag;
    [req setTimeoutInterval:30];
    [req setCookieWithCookiesArray:[self getCookie:req]];
    [self sendRequest:req];

}

- (void)sendRequestWithUrl:(NSString *)apiUrl Method:(NSString *)method AndParams:(NSDictionary *)paramsDict
{
    

    
    HttpRequest *req = [[HttpRequest alloc] initWithUrl:apiUrl method:method params:paramsDict];
    req.identifier = req.url;
    [self sendRequest:req];
}

- (void)sendRequest:(HttpRequest *)req
{   
    NSLog(@"请求API的url是：%@ method:%@ params:%@ header:%@", req.url, req.method, req.params, req.request.allHTTPHeaderFields);
    [_httpDispatcher enqueueRquest:req WithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (self.httpdelegate && [self.httpdelegate respondsToSelector:@selector(finishedWithRequest:Response:AndError:)]) {
            HttpResponse * rsp = [[HttpResponse alloc] init];
            rsp.response = operation.response;
            rsp.responseData = operation.responseData;
            rsp.responseString = operation.responseString;
            
            
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:rsp.responseData options:NSJSONReadingAllowFragments error:nil];
            
            NSLog(@"_object :%@",dic);
            
            NSObject *e = [dic objectForKey:@"e"];
            int json_e = [(NSNumber*)e intValue];
            
            if (json_e == -1)
            {
                
                [APSProgress hidenIndicatorView];
                
                [APSProgress showHUDAddedTo:[DataSingleton Instance].curVC.view message:[dic objectForKey:@"msg"] animated:YES];
                
//                return;
            }
            
            
            [self.httpdelegate finishedWithRequest:req Response:rsp AndError:nil];
            
            if (json_e == 0 && [req.apiName isEqual:NET_MATCH_INFO])
            {
                [self.httpdelegate finishedWithScuessData:dic];
            }
            
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (self.httpdelegate && [self.httpdelegate respondsToSelector:@selector(finishedWithRequest:Response:AndError:)]) {
            HttpResponse * rsp = [[HttpResponse alloc] init];
            rsp.response = operation.response;
            rsp.responseData = operation.responseData;
            rsp.responseString = operation.responseString;
//            [self.httpdelegate finishedWithRequest:req Response:rsp AndError:error];
            

            [APSProgress hideHUDWithAnimated:YES];
            
            [APSProgress showToast:nil withMessage:@"网络不畅"];

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

@end
