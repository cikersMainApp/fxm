//
//  APSProgress.h
//  apos-enterprise-ios
//
//  Created by cpz on 14-7-29.
//  Copyright (c) 2014年 cpz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APSProgress : NSObject


+ (void)showHUDAddedTo:(UIView *)view animated:(BOOL)animated;


+ (BOOL)hideHUDWithAnimated:(BOOL)animated;


+(void)showNetworkErrorToast:(UIView *)view;


+ (void)showHUDAddedTo:(UIView *)view  message:(NSString*) message animated:(BOOL)animated;

+(void) showIndicatorView;

+(void) hidenIndicatorView;

+(void)showToast:(UIView *)view withMessage:(NSString *) message;
@end
