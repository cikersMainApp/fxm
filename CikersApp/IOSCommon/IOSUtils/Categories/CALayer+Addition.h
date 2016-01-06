//
//  CALayer+Addition.h
//  CikersApp
//
//  Created by fxm on 16/1/1.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


@interface CALayer(Additions)

@property(nonatomic,strong)UIColor *borderColorFromUIColor;

- (void)setBorderColorFromUIColor:(UIColor *)color;


@end
