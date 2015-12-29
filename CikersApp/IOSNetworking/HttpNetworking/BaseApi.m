//
//  BaseApi.m
//  TestProject
//
//  Created by Wang Xuyang on 2/21/13.
//  Copyright (c) 2013 Pingan. All rights reserved.
//

#import "BaseApi.h"
#import "CommonCallback.h"
@interface BaseApi()
@property (nonatomic,strong) CommonCallback * callbackDelegate;
@end

@implementation BaseApi

@synthesize delegate = _delegate;
@synthesize httpDispatcher = _httpDispatcher;

- (id)initWithDelegate:(id<BaseApiDelegate,CommonCallbackDelegate>)newDelegate needCommonProcess:(BOOL) need
{
    self = [super init];
    if (self) {
        if (need) {
            self.callbackDelegate = [[CommonCallback alloc] init];
            self.callbackDelegate.delegate = newDelegate;
            self.delegate = self.callbackDelegate;
        }
        else
        {
            self.delegate = newDelegate;
        }
        
        _httpDispatcher = [[HttpDispatcher alloc] initConcurrentQueue];
    }
    return self;
}

- (void)dealloc
{
    _delegate = nil;
}

#pragma mark - common
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
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(finishedWithRequest:Response:AndError:)]) {
            HttpResponse * rsp = [[HttpResponse alloc] init];
            rsp.response = operation.response;
            rsp.responseData = operation.responseData;
            rsp.responseString = operation.responseString;
            [self.delegate finishedWithRequest:req Response:rsp AndError:nil];
            
            
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:rsp.responseData options:NSJSONReadingAllowFragments error:nil];
            
            NSLog(@"_object :%@",dic);
            
            NSObject *e = [dic objectForKey:@"e"];
            int json_e = [(NSNumber*)e intValue];
            
            
            if (json_e == 0 && [req.apiName isEqual:NET_MATCH_INFO])
            {
                [self.delegate finishedWithScuessData:dic];

            }
            
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(finishedWithRequest:Response:AndError:)]) {
            HttpResponse * rsp = [[HttpResponse alloc] init];
            rsp.response = operation.response;
            rsp.responseData = operation.responseData;
            rsp.responseString = operation.responseString;
            [self.delegate finishedWithRequest:req Response:rsp AndError:error];
            
//            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:rsp.responseData options:NSJSONReadingAllowFragments error:nil];
            
//            NSLog(@"_object :%@",dic);

            [APSProgress hideHUDWithAnimated:YES];
            

//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"网络错误" message:@"请兄弟姐们们看下是否有网" delegate:nil cancelButtonTitle:@"明白" otherButtonTitles:nil, nil];
//            [alert show];
            
        }
        
    }];
}

@end
