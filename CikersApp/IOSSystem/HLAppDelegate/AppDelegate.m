//
//  AppDelegate.m
//  TeaLife
//
//  Created by administrater on 15/12/2.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "AppDelegate.h"
#import "CrashUtil.h"
#import "HLNavgationController.h"
#import "HLTabBarController.h"
#import "UMSocial.h"

#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"

#import "MAThemeKit.h"
#import "CreatTeam.h"

#import "ICSDrawerController.h"
#import "BaoyuLeftViewController.h"
#import "TeamMainVC.h"

#import "GameVC.h"
#import "GameLeftVC.h"

//启动加载公告图片
#import "UIView+TYLaunchAnimation.h"
#import "TYLaunchFadeScaleAnimation.h"
#import "UIImage+TYLaunchImage.h"
#import "TAdLaunchImageView.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //InstallUncaughtExceptionHandler();
    // Override point for customization after application launch.
    
    [MAThemeKit setupThemeWithPrimaryColor:[MAThemeKit colorWithR:COLOR_R G:COLOR_G B:COLOR_B] secondaryColor:[UIColor whiteColor] fontName:@"HelveticaNeue-Light" lightStatusBar:YES];
    [MAThemeKit colorWithHexString:@"2e3959"];
    
    
    //添加分享
    
    [UMSocialData setAppKey:@"507fcab25270157b37000010"];
    
    //打开调试log的开关
    [UMSocialData openLog:NO];

    
    //设置微信AppId，设置分享url，默认使用友盟的网址
    [UMSocialWechatHandler setWXAppId:@"wxdc1e388c3822c80b" appSecret:@"a393c1527aaccb95f3a4c88d6d1455f6" url:@"http://www.umeng.com/social"];
    

    //    //设置分享到QQ空间的应用Id，和分享url 链接
    [UMSocialQQHandler setQQWithAppId:@"100424468" appKey:@"c7394704798a158208a74ab60104f0ba" url:@"http://www.umeng.com/social"];
    
    //    //设置支持没有客户端情况下使用SSO授权
    [UMSocialQQHandler setSupportWebView:YES];
    

    
    // Ad(广告) FadeAnimation
    TAdLaunchImageView *adLaunchImageView = [[TAdLaunchImageView alloc]initWithImage:[UIImage ty_getLaunchImage]];
    adLaunchImageView.URLString = @"http://static.cikers.com/repos/thumbnail/s170/themes/cms/soccermanager/images/logo.png";
    
    // 显示imageView
    [adLaunchImageView showInWindowWithAnimation:[TYLaunchFadeScaleAnimation fadeAnimationWithDelay:3.0] completion:^(BOOL finished) {
        
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        NSLog(@"finished");
        
        
        [AppDelegate setLoginRoot];

    }];
    
    __typeof (self) __weak weakSelf = self;
    // 点击广告block
    [adLaunchImageView setClickedImageURLHandle:^(NSString *URLString) {
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        [weakSelf pushAdViewCntroller];
        NSLog(@"clickedImageURLHandle");
    }];

    
    return YES;
}
- (void)pushAdViewCntroller
{
    
    
    [AppDelegate setLoginRoot];
    
//    // 获取到navVC
//    UITabBarController *tabbBarVC = (UITabBarController *)self.window.rootViewController;
//    UINavigationController *navVC = tabbBarVC.viewControllers.firstObject;
//    
//    // 你要推出的VC
//    UIViewController *VC = [[UIViewController alloc]init];
//    VC.view.backgroundColor = [UIColor redColor];
//    [navVC pushViewController:VC animated:YES];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


+(void) setPlayerinfoRoot
{
    HLNavgationController *  loginNav =  [[UIStoryboard storyboardWithName:@"Playerinfo" bundle:nil] instantiateViewControllerWithIdentifier:@"playerinfo"];
    AppDelegate * appDele = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDele.window.rootViewController = loginNav;
}

+(void)setGameRoot
{
    GameVC *  loginNav =  [[UIStoryboard storyboardWithName:@"Game" bundle:nil] instantiateViewControllerWithIdentifier:@"game"];
    
    AppDelegate * appDele = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    GameLeftVC *leftVC = [[GameLeftVC alloc] init];
    
    ICSDrawerController *drawer = [[ICSDrawerController alloc] initWithLeftViewController:leftVC centerViewController:loginNav];
    
    [appDele.window.rootViewController showViewController:drawer sender:nil];

}

+(void) setTeamRoot
{
    TeamMainVC *  loginNav =  [[UIStoryboard storyboardWithName:@"Team" bundle:nil] instantiateViewControllerWithIdentifier:@"team"];
    
    AppDelegate * appDele = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    BaoyuLeftViewController *leftVC = [[BaoyuLeftViewController alloc] init];

    ICSDrawerController *drawer = [[ICSDrawerController alloc] initWithLeftViewController:leftVC centerViewController:loginNav];

    
    [appDele.window.rootViewController showViewController:drawer sender:nil];
    
    
}

+(void)setTeamCreat
{
    CreatTeam *nextvc = [[UIStoryboard storyboardWithName:@"TeamCreat" bundle:nil] instantiateViewControllerWithIdentifier:@"teamcreat"];
    

    AppDelegate * appDele = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [appDele.window.rootViewController presentViewController:nextvc animated:YES completion:nil];
    
}


+(void) setLoginRoot
{
    HLNavgationController *  loginNav =  [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"login"];
    AppDelegate * appDele = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDele.window.rootViewController = loginNav;
}

+(void) setTabRoot
{
    HLTabBarController * tabbar = [[HLTabBarController alloc] init];
    
    HLNavgationController * loanNav = [self createTabWithStoryboardName:@"WikiMain" identifier:@"wikimain" title:@"主页" image:@"tab_wiki"];
    HLNavgationController * loanNav1 = [self createTabWithStoryboardName:@"Search" identifier:@"search" title:@"搜索" image:@"tab_search"];
    HLNavgationController * loanNav2 = [self createTabWithStoryboardName:@"Publish" identifier:@"publish" title:@"" image:@"tab_publish"];
    HLNavgationController * creditNav = [self createTabWithStoryboardName:@"Message" identifier:@"message" title:@"消息" image:@"tab_message"];
    HLNavgationController * personalNav = [self createTabWithStoryboardName:@"Myinfo" identifier:@"myinfo" title:@"我" image:@"tab_personal"];
    
    tabbar.viewControllers = [NSArray arrayWithObjects:loanNav,loanNav1,loanNav2,creditNav,personalNav, nil];
    
    AppDelegate * appDele = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDele.window.rootViewController = tabbar;
}

+ (HLNavgationController *) createTabWithStoryboardName:(NSString *) storyName
                                             identifier:(NSString *) identifier
                                                  title:(NSString *) title
                                                  image:(NSString *) imageName
{
    HLNavgationController *  nav =  [[UIStoryboard storyboardWithName:storyName bundle:nil] instantiateViewControllerWithIdentifier:identifier];
    if (title && imageName) {
        
        UIImage *normal = [UIImage imageNamed:imageName];
        normal = [normal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
        UIImage *selectimg = [UIImage imageNamed:[NSString stringWithFormat:@"%@select",imageName]];
        selectimg = [selectimg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
        UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTitle:title image:normal selectedImage:selectimg];

        
        nav.topViewController.tabBarItem = firstItem;
    }
    
    return nav;
}

@end
