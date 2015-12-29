//
//  HLTableView.m
//  TeaLife
//
//  Created by administrater on 15/12/2.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "HLTableView.h"

@implementation HLTableView

- (void)setExtraCellLineHidden
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
}

- (void) awakeFromNib
{
    if (DEVICE_VERSION >= 8.0) {
        self.layoutMargins = UIEdgeInsetsZero;
    }
    [self setExtraCellLineHidden];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.hlDelegate touchTable];
    [super touchesBegan:touches withEvent:event];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
