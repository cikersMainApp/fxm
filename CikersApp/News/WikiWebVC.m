//
//  WikiWebVC.m
//  CikersApp
//
//  Created by fxm on 16/3/14.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiWebVC.h"

@interface WikiWebVC ()

@end

@implementation WikiWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

-(void)initUrl:(NSString *)uid
{

    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    web.scalesPageToFit = YES;
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@wiki/uviewlite/%@",HOST,uid]];//创建URL
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
