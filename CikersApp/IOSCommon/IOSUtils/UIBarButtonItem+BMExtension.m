//
//  UIBarButtonItem+BMExtension.m
//  BMDeliverySpecialists
//
//  Created by fenglh on 15/10/26.
//  Copyright (c) 2015年 BlueMoon. All rights reserved.
//

#import "UIBarButtonItem+BMExtension.h"



#pragma mark 内部类 BMItemExButton
@interface BMItemExButton : UIButton
@property (copy, nonatomic) dispatch_block_t action;
@end

@implementation BMItemExButton

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
        self.action();
    }
}
@end


#pragma mark 分类 BMItemExButton
@implementation UIBarButtonItem (BMExtension)

+ (instancetype)dd_barButtonItemTitleWithFrame:(CGRect )frame
                                         title:(NSString *)title
                                    titleColor:(UIColor *)titleColor
                                          font:(UIFont *)font
                                     tapAction:(dispatch_block_t)tapAction
{
    BMItemExButton *btn = [BMItemExButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.action = tapAction;
    btn.titleLabel.font = font;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}
@end
