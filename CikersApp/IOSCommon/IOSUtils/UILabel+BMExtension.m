//
//  UILabel+BMExtension.m
//  BMDeliverySpecialists
//
//  Created by fenglh on 15/10/29.
//  Copyright (c) 2015年 BlueMoon. All rights reserved.
//

#import "UILabel+BMExtension.h"


@implementation UILabel (BMExtension)


+ (instancetype)dd_labelWithFrame:(CGRect )frame
                            title:(NSString *)title
                       titleColor:(UIColor *)titleColor
                    textAlignment:(NSTextAlignment)textAlignment
                             font:(UIFont *)font{
    UILabel *label  = [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    label.textColor = titleColor;
    label.textAlignment = textAlignment;
    label.font = font;
    return label;
}
@end
