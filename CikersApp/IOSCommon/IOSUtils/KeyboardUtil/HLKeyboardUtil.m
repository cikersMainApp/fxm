//
//  TeaLife.m
//  HLKeyboardUtil
//
//  Created by install on 14-10-8.
//  Copyright (c) 2014年 Horrace Lin. All rights reserved.
//

#import "HLKeyboardUtil.h"

@implementation HLKeyboardUtil

+ (void) hideCurrentKeyboard
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}
@end
