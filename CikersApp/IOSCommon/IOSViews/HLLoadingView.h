//
//  HLLoadingView.h
//  LeRong
//
//  Created by administrater on 15/11/10.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLLoadingView : UIView
- (id) initWithFrame:(CGRect)frame withSuperView:(UIView *) spView;
- (void) beginAnimation;
- (void) endAnimation;
- (void) endAnimationWithAnimationTime:(CGFloat) time;
@end
