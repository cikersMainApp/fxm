//
//  GameLeftVC.h
//  CikersApp
//
//  Created by fxm on 15/12/31.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"

@interface GameLeftVC : UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting>

@property (nonatomic,weak) ICSDrawerController *drawer;

@end
