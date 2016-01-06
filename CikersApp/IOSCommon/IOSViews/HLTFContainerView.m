//
//  HLTFContainerView.m
//  TeaLife
//
//  Created by Local on 15/12/6.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "HLTFContainerView.h"

@implementation HLTFContainerView

- (void) layoutSubviews
{
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code


    //背景为灰色
    
//    self.backgroundColor = [UIColor blackColor];
}



-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"currentResponder"]) {
        UIView * real = [change objectForKey:@"new"];
        if (real) {
            for (UIView * subview in self.subviews) {
                if (subview == real) {
                    NSLog(@"%@",NSStringFromCGRect(subview.frame));
                }
            }
        }
        
    }
}

- (id)findFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        if ([subView isFirstResponder]) {
            return subView;
        }
    }
    return nil;
}
@end
