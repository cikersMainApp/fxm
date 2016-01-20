//
//  HLNavgationController.m
//  LeRong
//
//  Created by administrater on 15/9/29.
//  Copyright (c) 2015年 administrater. All rights reserved.
//

#import "HLNavgationController.h"

@interface HLNavgationController ()

@end

@implementation HLNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    

    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault];

    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    
    CGRect bounds = self.navigationBar.bounds;
    bounds.size.height +=20;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                   byRoundingCorners:(UIRectCornerAllCorners)
                                                         cornerRadii:CGSizeMake(10.0, 10.0)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    
//    [self.navigationBar.layer addSublayer:maskLayer];
//    self.navigationBar.layer.mask = maskLayer;
    self.navigationBar.layer.shadowOffset = CGSizeMake(3, 3);
    self.navigationBar.layer.shadowOpacity = 0.7;
    self.navigationBar.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.navigationBar.bounds].CGPath;

    
}

-(void)nav_addBntWhereTitle
{
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt setTitle:@"推荐" forState:UIControlStateNormal];
    [bt setFrame:CGRectMake(200, 50, 30, 30)];
    [self.navigationBar addSubview:bt];
    
}


+(UIImage*) imageWithColor:(UIColor*)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    viewController.navigationController.navigationBar.translucent = NO;
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
