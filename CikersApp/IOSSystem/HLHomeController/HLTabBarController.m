//
//  HLTabBarController.m
//  LeRong
//
//  Created by administrater on 15/9/25.
//  Copyright (c) 2015年 administrater. All rights reserved.
//

#import "HLTabBarController.h"

@interface HLTabBarController ()

@end

@implementation HLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
//     [[UITabBar appearance] setBackgroundImage:[[HLTabBarController imageWithColor:SUBJECT_COLOR] resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch]];

    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_bottombar"]];
    img.frame = CGRectMake(0, 0, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
    img.contentMode = UIViewContentModeScaleToFill;
    //img.frame = CGRectOffset(img.frame, 0, 1);
    [[self tabBar] insertSubview:img atIndex:0];
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       
                                                       [UIColor whiteColor], NSForegroundColorAttributeName,
                                                       
                                                       nil] forState:UIControlStateNormal];
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       
                                                       [UIColor orangeColor], NSForegroundColorAttributeName,
                                                       
                                                       nil] forState:UIControlStateSelected];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
