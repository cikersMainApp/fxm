//
//  TeamMainSection1.h
//  CikersApp
//
//  Created by fxm on 15/12/26.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameSection1 : UIView

@property(nonatomic,weak)IBOutlet UIView *view_head;


-(void)initUI;


-(IBAction)bnt_follow:(id)sender;
-(IBAction)bnt_baoming:(id)sender;

@end
