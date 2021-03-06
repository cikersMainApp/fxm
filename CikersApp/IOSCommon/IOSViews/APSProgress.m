//
//  APSProgress.m
//  apos-enterprise-ios
//
//  Created by cpz on 14-7-29.
//  Copyright (c) 2014年 cpz. All rights reserved.
//

#import "APSProgress.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"

@implementation APSProgress

static __weak UIView *currentView;


+ (void)showHUDAddedTo:(UIView *)view animated:(BOOL)animated; {
    currentView = view;
    [MBProgressHUD showHUDAddedTo:view animated:animated];
}

+ (BOOL)hideHUDWithAnimated:(BOOL)animated {
    
    if(currentView) {
        return [MBProgressHUD hideHUDForView:currentView animated:animated];
        currentView = nil;
    }
    return NO;
}

+(void)showNetworkErrorToast:(UIView *)view{

    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
	[view addSubview:HUD];
    //	// Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
	HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = @"网络请求失败";
    [HUD show:YES];
	[HUD hide:YES afterDelay:2];
}


+ (void)showHUDAddedTo:(UIView *)view  message:(NSString*) message animated:(BOOL)animated; {
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
	[view addSubview:HUD];
//	HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    HUD.mode = MBProgressHUDModeText;
    HUD.labelText = message;
    [HUD show:YES];
	[HUD hide:YES afterDelay:1];
}

+(void) showIndicatorView  {

    AppDelegate  * appDele = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    appDele.window.userInteractionEnabled = NO;
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:appDele.window];
	HUD.labelText = @"处理中...";
    [appDele.window addSubview:HUD];
	[HUD show:YES];

}

+(void) hidenIndicatorView {
    AppDelegate  * appDele = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [MBProgressHUD hideAllHUDsForView:appDele.window animated:YES];
}

+(void)showToast:(UIView *)view withMessage:(NSString *) message{
    
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:HUD];
    //	// Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = message;
    [HUD show:YES];
    [HUD hide:YES afterDelay:2];
}

@end
