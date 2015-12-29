//
//  HLLoadingView.m
//  LeRong
//
//  Created by administrater on 15/11/10.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "HLLoadingView.h"

@interface HLLoadingView()
@property (nonatomic,strong) UIView * mySuperView;
@end
@implementation HLLoadingView

- (id) initWithFrame:(CGRect)frame withSuperView:(UIView *) spView
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.alpha = 0.f;
        self.mySuperView = spView;
    }
    return self;
}

- (void) beginAnimation
{
    [APSProgress showIndicatorView];
    [self.mySuperView addSubview:self];
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1.f;
    }];
}

- (void) endAnimation
{
    [APSProgress hidenIndicatorView];
    [self removeFromSuperview];
}

- (void) endAnimationWithAnimationTime:(CGFloat) time
{
    [APSProgress hidenIndicatorView];
    [UIView animateWithDuration:time animations:^{
        
    }completion:^(BOOL finished) {
        self.alpha = 0.8f;
        [self removeFromSuperview];
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
