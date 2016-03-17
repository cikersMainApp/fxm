//
//  WikiLookVC.m
//  CikersApp
//
//  Created by fxm on 16/1/4.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "WikiLookVC.h"
#import "SDWebImage/UIImageView+WebCache.h"
@interface WikiLookVC ()

@end

@implementation WikiLookVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, ScreenWidth, ScreenHeight-60)];
    
    UIView *view_scroll = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth*[self.array_imgs count], scroll.frame.size.height)];
    
    for (int i = 0; i<[self.array_imgs count]; i++)
    {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, i*ScreenWidth, view_scroll.frame.size.height)];
        [view_scroll addSubview:img];
        
        NSString *url1 = [NSString stringWithFormat:@"%@%@",HOST_IMAGE,[self.array_imgs objectAtIndex:i]];
        [img sd_setImageWithURL:[NSURL URLWithString:url1]];
    }
    
    [scroll addSubview:view_scroll];
    [scroll setContentSize:CGSizeMake(view_scroll.frame.size.width, ScreenHeight-60)];
    scroll.showsHorizontalScrollIndicator = YES;
    scroll.pagingEnabled = YES;
    [self.view addSubview:scroll];
    
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
