//
//  TeamContentView.h
//  CikersApp
//
//  Created by fxm on 15/12/22.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DroppyScrollView.h"
@interface TeamContentView : UIView
@property (nonatomic, strong) DroppyScrollView *droppy;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic)float f_width;


-(void)initUI;

-(void)inithead;
-(void)initSecond;
-(void)initMenu;
-(void)initWiki;

-(void)bnt_action:(id)sender;

@end
