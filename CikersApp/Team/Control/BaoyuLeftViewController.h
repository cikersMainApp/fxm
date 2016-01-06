//
//  BaoyuLeftViewController.h
//  测拉测试_1
//
//  Created by qianfeng on 15/12/21.
//  Copyright (c) 2015年 Muzibaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"

@interface BaoyuLeftViewController : UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting>

@property (nonatomic,weak) ICSDrawerController *drawer;

@end
