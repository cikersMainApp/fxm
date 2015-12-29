//
//  HLFullButton.m
//  LeRong
//
//  Created by Local on 15/11/7.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "HLFullButton.h"

@implementation HLFullButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.cornerRadius = 3.f;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.layer.masksToBounds = YES;
    [self setBackgroundImage:[HLImageUtil createImageWithColor:[UIColor colorWithHexString:@"1987cf"]] forState:UIControlStateNormal];
}

@end
