//
//  MatchToolButton.m
//  CikersApp
//
//  Created by fxm on 15/12/31.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "MatchToolButton.h"

@implementation MatchToolButton
//
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    self.layer.cornerRadius = 3.f;
//    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    self.layer.masksToBounds = YES;
//    [self setBackgroundImage:[HLImageUtil createImageWithColor:[UIColor colorWithHexString:@"1987cf"]] forState:UIControlStateNormal];
//}

-(CGRect)titleRectForContentRect:(CGRect)contentRect

{
    
    CGFloat titleY = contentRect.size.height *0.6;
    
    CGFloat titleW = contentRect.size.width;
    
    CGFloat titleH = contentRect.size.height - titleY;
    
    return CGRectMake(0, titleY, titleW, titleH);
    
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect

{
    
    CGFloat imageW = CGRectGetWidth(contentRect);
    
    CGFloat imageH = contentRect.size.height * 0.6;
    
    return CGRectMake(0, 0, imageW, imageH);
    
}
@end
