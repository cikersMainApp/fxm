//
//  HLLoginOperation.m
//  TeaLife
//
//  Created by administrater on 15/12/7.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "HLLoginOperation.h"
#import "Api.h"
#import "AppDelegate.h"
#import "HLLoadingView.h"
@interface HLLoginOperation()<BaseApiDelegate>
@property (nonatomic,strong) dispatch_semaphore_t semaphore;
@property (nonatomic,strong) id response;
@property (nonatomic,strong) Api  * api;
@property (nonatomic,strong) HLLoadingView * loadingView;
@end

@implementation HLLoginOperation
- (id) init
{
    if (self = [super init]) {
        self.api = [[Api alloc] initWithDelegate:self needCommonProcess:NO];
        self.semaphore = dispatch_semaphore_create(0);
        AppDelegate * appDele = (AppDelegate *)[UIApplication sharedApplication].delegate;
        self.loadingView = [[HLLoadingView alloc] initWithFrame:appDele.window.bounds withSuperView:appDele.window];
    }
    return self;
}


-(void)userLoginByname:(NSString *)phone pwd:(NSString *)pwd completeBlock:(void (^)(id, NSError *))completeBlock
{


    [HLKeyboardUtil hideCurrentKeyboard];
    
    [APSProgress showIndicatorView];
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
    
        [self.api user_login:phone userPwd:pwd deviceValue:@""];
    

        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
        
        HttpResponse *myResponse = self.response;
        
        if (myResponse)
        {
            NSError *error = nil;
            
            NSDictionary * resultDic = [NSJSONSerialization JSONObjectWithData:myResponse.responseData options:NSJSONReadingAllowFragments error:&error];
            self.response = nil;
            
            dispatch_async(dispatch_get_main_queue(), ^{
            
                completeBlock(resultDic,nil);
                
            });
            
        }
    
    
    });
    
    
    
    
}

- (void) vericodeGetByPhone:(NSString *) phoneNumber completeBlock:(void(^)(id result,NSError * error)) completeBlock
{
    [HLKeyboardUtil hideCurrentKeyboard];
    [APSProgress showIndicatorView];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [self.api getVerityCode:phoneNumber];
        
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
        
        HttpResponse * myResponse = self.response;
        if (myResponse) {
            NSError * error = nil;
            NSDictionary * resultDic = [NSJSONSerialization JSONObjectWithData:myResponse.responseData options:NSJSONReadingAllowFragments error:&error];
            self.response = nil;
            
            NSLog(@"%@",resultDic);
            NSString *e  = [resultDic objectForKey:@"e"];
            NSLog(@"%@",e);
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completeBlock(resultDic,nil);
            });
        }
    });
}

- (void) verifyVericodeByPhone:(NSString *) phoneNumber vericode:(NSString *) vericode completeBlock:(void(^)(id result,NSError * error)) completeBlock
{
    [HLKeyboardUtil hideCurrentKeyboard];
    
    [APSProgress showIndicatorView];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self.api verifyVericode:phoneNumber
//                      verifyCode:vericode];
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
        HttpResponse * myResponse = self.response;
        if (myResponse) {
            self.response = nil;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.loadingView beginAnimation];
                [AppDelegate setTabRoot];
                [self.loadingView endAnimationWithAnimationTime:2];
                completeBlock(@"success",nil);
            });
        }
    });
    
}

- (void)finishedWithRequest:(HttpRequest *)request
                   Response:(HttpResponse *)response
                   AndError:(NSError *)error
{
    AppDelegate * app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (error) {
        [APSProgress hidenIndicatorView];

        [[HLAlertManager shareInstance] showNoCancelAlertByTitle:@"提示" message:@"系统错误" delegate:nil presentBaseVC:app.window.rootViewController sureBlock:^(id sureResult) {
            
        }];
        return;
    }
    NSDictionary * resultDic = [NSJSONSerialization JSONObjectWithData:response.responseData options:NSJSONReadingAllowFragments error:nil];
    if (!error && ![[resultDic objectForKey:@"errorCode"] boolValue]) {
        [APSProgress hidenIndicatorView];
        self.response = response;
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [APSProgress hidenIndicatorView];
            [[HLAlertManager shareInstance] showNoCancelAlertByTitle:@"提示" message:[resultDic objectForKey:@"result"] delegate:nil presentBaseVC:app.window.rootViewController sureBlock:^(id sureResult) {
                
            }];
            //[[HLAlertManager shareInstance] showNoCancelAlertByTitle:@"提示" message:[resultDic objectForKey:@"result"] delegate:nil];
        });
    }
    dispatch_semaphore_signal(self.semaphore);
}
@end
