//
//  HttpDispatcher.m
//  CMNetworking
//
//  Created by Wang Xuyang on 2/17/13.
//  Copyright (c) 2012 Wang Xuyang. All rights reserved.
//

#import "HttpDispatcher.h"

@implementation HttpDispatcher

- (id)initWithConcurrentCount:(int)count
{
    self = [super init];
    if (self) {
        _requestHandlers = [[NSMutableDictionary alloc] init];
        
        _requestsQueue = [[NSOperationQueue alloc] init];
        [_requestsQueue setMaxConcurrentOperationCount:count];
        [_requestsQueue cancelAllOperations];
        [_requestsQueue setSuspended:YES];
    }
    return self;
}

- (id)initSerialQueue
{
    return [self initWithConcurrentCount:1];
}

- (id)initConcurrentQueue
{
    return [self initWithConcurrentCount:4];
}

- (void)enqueueRquest:(HttpRequest *)request
          WithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    // 校验
    if (!request) {
        HTTPLog(@"空的request不能入队列");
        return;
    }
    if (request.identifier == nil
        || [request.identifier isEqualToString:@""]
        || [request.identifier isEqualToString:DEFAULT_REQUEST_IDENTIFIER]) {
        HTTPLog(@"没有identifier，或identifier为默认值的request不能入队列");
        return;
    }
    if ([[_requestHandlers allKeys] containsObject:request.identifier]) {
        HTTPLog(@"重复的identifier不能入队列");
        return;
    }

    // 调度
    HTTPLog(@"enquequed operation is %@", request.url);
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request.request];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        [_requestHandlers removeObjectForKey:request.identifier]; // 删除请求的handle
        HTTPLog(@"[%@] succeed. %d operations remain.", request.identifier, [_requestHandlers count]);
        if (success) { //call block
            success(operation, responseObject);
        }
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        [_requestHandlers removeObjectForKey:request.identifier]; // 删除请求的handle
        HTTPLog(@"[%@] error. %d operations remain.", request.identifier, [_requestHandlers count]);
        if (failure) { //call block
            failure(operation, error);
        }
    }];
    [op start];
    
    // 记录新的请求handler
    [_requestHandlers setObject:op forKey:request.identifier];
    HTTPLog(@"[%@] enqueue. %d operations remain.", request.identifier, [_requestHandlers count]);

//        [_requestHandlers removeObjectForKey:request.identifier]; // 删除请求的handle
//        if (request && [request isCanceled]) { // 取消
//            HTTPLog(@"%@ canceled. %d operations remain.", request.identifier, [_requestHandlers count]);
//        }
//        else if (request && [request isFinished]) { // 正常完成
//            HTTPLog(@"%@ finished. %d operations remain.", request.identifier, [_requestHandlers count]);
//        }

}

- (void)cancelAll
{
    for (NSString *key in [_requestHandlers allKeys]) {
        [self cancelWithIdentifier:key];
    }
}

- (void)cancelWithIdentifier:(NSString *)identifier
{
    if (![[_requestHandlers allKeys] containsObject:identifier]) {
        HTTPLog(@"该请求不存在或已完成");
        return;
    }
    NSOperation *op = [_requestHandlers objectForKey:identifier];
    [op cancel];
    
    [_requestHandlers removeObjectForKey:identifier]; // 删除请求的handle
    HTTPLog(@"[%@] canceled. %d operations remain.", identifier, [_requestHandlers count]);
}

- (int)countOfOperations
{
    return [_requestHandlers count];
}

@end
