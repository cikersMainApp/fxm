//
//  BaseNavigationBar.m
//  CikersApp
//
//  Created by fxm on 16/1/20.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "BaseNavigationBar.h"

@implementation BaseNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation UINavigationBar (customBar)
- (void)customNavigationBar {
    if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [self setBackgroundImage:[UIImage imageNamed:@"nav_img"] forBarMetrics:UIBarMetricsDefault];
    } else {
        [self drawRect:self.bounds];
    }
    
//    [self drawRoundCornerAndShadow];
}


- (void)drawRect:(CGRect)rect {
    [[UIImage imageNamed:@"nav_img"] drawInRect:rect];
}

- (void)drawRoundCornerAndShadow {
    CGRect bounds = self.bounds;
    bounds.size.height +=10;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                   byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                                         cornerRadii:CGSizeMake(10.0, 10.0)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    
//    [self.layer addSublayer:maskLayer];
//    self.layer.mask = maskLayer;
    self.layer.shadowOffset = CGSizeMake(3, 3);
    self.layer.shadowOpacity = 0.7;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
}
@end
