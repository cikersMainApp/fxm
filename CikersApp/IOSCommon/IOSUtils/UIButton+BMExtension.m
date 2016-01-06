//
//  UIButton+BMExtension.m
//  BMDeliverySpecialists
//
//  Created by fenglh on 15/10/29.
//  Copyright (c) 2015年 BlueMoon. All rights reserved.
//

#import "UIButton+BMExtension.h"


#pragma mark 内部类 BMExButton
@interface BMExButton : UIButton
@property (copy, nonatomic) TapButtonActionBlock action;
@end


@implementation BMExButton

- (instancetype)init
{
    if(self = [super init])
    {
        [self addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
-(void)btnClick:(UIButton *)button
{
    if(self.action)
    {
        self.action(self);
    }
}
@end




@implementation UIButton (BMExtension)


//  创建普通按钮
+ (instancetype)dd_buttonCustomButtonWithFrame:(CGRect)frame
                                         title:(NSString *)title
                               backgroundColor:(UIColor *)backgroundColor
                                    titleColor:(UIColor *)titleColor
                                     tapAction:(TapButtonActionBlock)tapAction
{
    BMExButton *btn = [BMExButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.backgroundColor = backgroundColor;
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.clipsToBounds = YES;
    btn.action = tapAction;
    return btn;
}

//  创建图片按钮
+ (instancetype)dd_buttonSystemButtonWithFrame:(CGRect)frame
                   NormalBackgroundImageString:(NSString *)imageString
                                     tapAction:(TapButtonActionBlock)tapAction
{
    BMExButton *btn = [BMExButton buttonWithType:UIButtonTypeSystem];
    btn.frame = frame;
    [btn setBackgroundImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
    btn.clipsToBounds = YES;
    btn.action = tapAction;
    return btn;
}
@end
