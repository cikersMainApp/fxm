//
//  UIResponder+FirstResponder.m
//  TeaLife
//
//  Created by Local on 15/12/6.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import "UIResponder+FirstResponder.h"
#import "AppDelegate.h"
static __weak UIResponder * currentFirstResponder;
@implementation UIResponder (FirstResponder)

+ (id)currentFirstResponder
{
    currentFirstResponder = nil;
    
    [[UIApplication sharedApplication] sendAction:@selector(findFirstResponder:) to:nil from:nil forEvent:nil];
    AppDelegate * appDele = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDele.currentResponder = currentFirstResponder;
    return currentFirstResponder;
}

- (void)findFirstResponder:(id)sender
{
    currentFirstResponder = self;
}
@end
