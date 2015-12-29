//
//  HttpDispatcher.h
//  CMNetworking
//
//  Created by Wang Xuyang on 2/17/13.
//  Copyright (c) 2012 Wang Xuyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequest.h"
#import "AFNetworking.h"

@interface HttpDispatcher : NSObject {
    NSMutableDictionary *_requestHandlers;
}

@property (nonatomic, strong) NSOperationQueue *requestsQueue;

/// 实例化一个线性队列
/// @说明 在队列前面的请求执行完毕后执行下一个请求。请求都是异步执行的。
- (id)initSerialQueue;
/// 实例化一个并发队列
/// @说明 队列里的所有任务会分别在一个线程里异步发起。每个请求都是异步执行的。
- (id)initConcurrentQueue;

/// 推一个请求进入队列
- (void)enqueueRquest:(HttpRequest *)request
          WithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/// 取消队列
- (void)cancelAll;
/// 取消队列中某个任务
- (void)cancelWithIdentifier:(NSString *)identifier;

/// 当前任务数
/// @说明 不保证原子性，读到的数字并不安全
- (int)countOfOperations;

@end
