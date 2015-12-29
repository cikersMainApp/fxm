//
//  ViewController.m
//  TeaLife
//
//  Created by administrater on 15/12/2.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "ViewController.h"
#import "APSStringUtil.h"
#import "AppDelegate.h"
#import "HLNavgationController.h"
#import "HLTabBarController.h"
#import "HLLoginViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults * config = [NSUserDefaults standardUserDefaults];
    if ([APSStringUtil isEmpty:[config objectForKey:PHONE_NUMBER]]) {
        [AppDelegate setLoginRoot];
    }
    else
    {
        [AppDelegate setTabRoot];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
