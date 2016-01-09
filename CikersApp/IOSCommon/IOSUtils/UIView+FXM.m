//
//  UIView+FXM.m
//  CikersApp
//
//  Created by fxm on 16/1/6.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "UIView+FXM.h"
#import <objc/runtime.h>
@implementation UIView (UIView_FXM)

static NSString *_nxtViews=@"userData";

-(void)UserData:(NSNumber *)userData1
{
 
    
    objc_setAssociatedObject(self, &_nxtViews, userData1, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(NSNumber*)userData
{
    return objc_getAssociatedObject(self, &_nxtViews);
}


@end
