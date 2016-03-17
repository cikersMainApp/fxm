//
//  MySettingAboutUs.m
//  CikersApp
//
//  Created by fxm on 16/2/27.
//  Copyright © 2016年 cikers. All rights reserved.
//

#define baseUrl @"http://mp.weixin.qq.com/s?__biz=MzA4Mzg0NjQ2NQ==&mid=208647680&idx=1&sn=3c1db89c6fc8ba829dd8c662065c995b"

#import "MySettingAboutUs.h"

@interface MySettingAboutUs ()

@end

@implementation MySettingAboutUs

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationItem.title = @"关于我们";
    
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    web.scalesPageToFit = YES;
    NSURL* url = [NSURL URLWithString:baseUrl];//创建URL
    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建NSURLRequest
    [web loadRequest:request];//加载
    [self.view addSubview:web];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
