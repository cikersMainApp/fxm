
//
//  UIView+DDExtension.m
//  DDCategories
//
//  Created by Daredos on 15/12/10.
//  Copyright (c) 2015年 BlueMoon. All rights reserved.
//

#import "UIView+DDExtension.h"

@implementation UIView (DDExtension)


- (CGFloat)dd_x
{
    return self.frame.origin.x;
}
- (void)dd_setX:(CGFloat)dd_x
{
    CGRect frame = self.frame;
    frame.origin.x = dd_x;
    self.frame = frame;
}

- (CGFloat)dd_y
{
    return self.frame.origin.y;
}
- (void)dd_setY:(CGFloat)dd_y
{
    CGRect frame = self.frame;
    frame.origin.x = dd_y;
    self.frame = frame;
}


- (CGFloat)dd_width
{
    return self.frame.size.width;
}
- (void)dd_setWidth:(CGFloat)dd_width
{
    CGRect frame = self.frame;
    frame.size.width = dd_width;
    self.frame = frame;
}

- (CGFloat)dd_height
{
    return self.frame.size.height;
}
- (void)dd_setHeight:(CGFloat)dd_height
{
    CGRect frame = self.frame;
    frame.size.height = dd_height;
    self.frame = frame;
}




- (CGPoint)dd_origin
{
    return self.frame.origin;
}
- (void)dd_setOrigin:(CGPoint)dd_origin
{
    CGRect frame = self.frame;
    frame.origin = dd_origin;
    self.frame = frame;
}

- (CGSize)dd_size
{
    return self.frame.size;
}
- (void)dd_setSize:(CGSize)dd_size
{
    CGRect frame = self.frame;
    frame.size = dd_size;
    self.frame = frame;
}



// 中点
- (CGFloat)dd_centerX
{
    return self.center.x;
}
- (void)dd_setCenterX:(CGFloat)dd_centerX
{
    CGPoint center = self.center;
    center.x = dd_centerX;
    self.center = center;
}
- (CGFloat)dd_centerY
{
    return self.center.y;
}
- (void)dd_setCenterY:(CGFloat)dd_centerY
{
    CGPoint center = self.center;
    center.y= dd_centerY;
    self.center = center;
}


// 圆角
- (CGFloat)dd_cornerRadius
{
    return self.layer.cornerRadius;
}
- (void)dd_setCornerRadius:(CGFloat)dd_cornerRadius
{
    self.layer.cornerRadius = dd_cornerRadius;
    self.clipsToBounds = YES;
}


@end
