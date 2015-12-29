//
//  BaseApi.h
//  TestProject
//
//  Created by Wang Xuyang on 2/21/13.
//  Copyright (c) 2013 Pingan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequest.h"
#import "HttpResponse.h"
#import "HttpDispatcher.h"
#import "AFHTTPRequestOperation.h"

@protocol BaseApiDelegate <NSObject>

@required
- (void)finishedWithRequest:(HttpRequest *)request
                   Response:(HttpResponse *)response
                   AndError:(NSError *)error;
// 使用时，下面两个方法二选一，优先使用第一个，新开发的单元中，不要使用第二个
//- (void)finishedWithRequest:(HttpRequest *)request
//                  Operation:(AFHTTPRequestOperation *)operation
//                   AndError:(NSError *)error;


@end

@interface BaseApi : NSObject

@property (nonatomic, weak) id<BaseApiDelegate> delegate;
@property (nonatomic, strong) HttpDispatcher *httpDispatcher;


- (id)initWithDelegate:(id<BaseApiDelegate>)newDelegate needCommonProcess:(BOOL) need;

- (void)sendRequestWithUrl:(NSString *)apiUrl Method:(NSString *)method AndParams:(NSDictionary *)paramsDict;
- (void)sendRequest:(HttpRequest *)req;

@end
