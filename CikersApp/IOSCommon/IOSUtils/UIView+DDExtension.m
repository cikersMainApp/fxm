
//
//  UIView+DDExtension.m
//  DDCategories
//
//  Created by Daredos on 15/12/10.
//  Copyright (c) 2015年 BlueMoon. All rights reserved.
//

#import "UIView+DDExtension.h"

@implementation UIView (DDExtension)


- (CGFloat)coustom_x
{
    return self.frame.origin.x;
}
- (void)coustom_setX:(CGFloat)coustom_x
{
    CGRect frame = self.frame;
    frame.origin.x = coustom_x;
    self.frame = frame;
}

- (CGFloat)coustom_y
{
    return self.frame.origin.y;
}
- (void)coustom_setY:(CGFloat)coustom_y
{
    CGRect frame = self.frame;
    frame.origin.x = coustom_y;
    self.frame = frame;
}


- (CGFloat)coustom_width
{
    return self.frame.size.width;
}
- (void)coustom_setWidth:(CGFloat)coustom_width
{
    CGRect frame = self.frame;
    frame.size.width = coustom_width;
    self.frame = frame;
}

- (CGFloat)coustom_height
{
    return self.frame.size.height;
}
- (void)coustom_setHeight:(CGFloat)coustom_height
{
    CGRect frame = self.frame;
    frame.size.height = coustom_height;
    self.frame = frame;
}




- (CGPoint)coustom_origin
{
    return self.frame.origin;
}
- (void)coustom_setOrigin:(CGPoint)coustom_origin
{
    CGRect frame = self.frame;
    frame.origin = coustom_origin;
    self.frame = frame;
}

- (CGSize)coustom_size
{
    return self.frame.size;
}
- (void)coustom_setSize:(CGSize)coustom_size
{
    CGRect frame = self.frame;
    frame.size = coustom_size;
    self.frame = frame;
}



// 中点
- (CGFloat)coustom_centerX
{
    return self.center.x;
}
- (void)coustom_setCenterX:(CGFloat)coustom_centerX
{
    CGPoint center = self.center;
    center.x = coustom_centerX;
    self.center = center;
}
- (CGFloat)coustom_centerY
{
    return self.center.y;
}
- (void)coustom_setCenterY:(CGFloat)coustom_centerY
{
    CGPoint center = self.center;
    center.y= coustom_centerY;
    self.center = center;
}


// 圆角
- (CGFloat)coustom_cornerRadius
{
    return self.layer.cornerRadius;
}
- (void)coustom_setCornerRadius:(CGFloat)coustom_cornerRadius
{
    self.layer.cornerRadius = coustom_cornerRadius;
    self.clipsToBounds = YES;
}


@end
