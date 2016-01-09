
//
//  HLGetVericodeButton.m
//  TeaLife
//
//  Created by Local on 15/12/10.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "HLGetVericodeButton.h"

@implementation HLGetVericodeButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void) layoutSubviews
{
    
    [super layoutSubviews];
    if (!self.countDownLabel) {
        self.countDownLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.countDownLabel.font = [self.titleLabel font];
        self.countDownLabel.textAlignment = NSTextAlignmentCenter;
        self.countDownLabel.textColor = self.titleLabel.textColor;
        [self addSubview: self.countDownLabel];
    }
    
    
}

- (void) changeStatus
{
    if (self.userInteractionEnabled) {
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[HLImageUtil createImageWithColor:SUBJECT_COLOR] forState:UIControlStateNormal];
    }
    else
    {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[HLImageUtil createImageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    }
}
@end
