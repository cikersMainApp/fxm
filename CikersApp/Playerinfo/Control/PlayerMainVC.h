//
//  PlayerMainVC.h
//  CikersApp
//
//  Created by fxm on 16/1/20.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
@interface PlayerMainVC : UIViewController<ICSDrawerControllerChild,ICSDrawerControllerPresenting>

@property(nonatomic,weak)ICSDrawerController *drawer;


@end
