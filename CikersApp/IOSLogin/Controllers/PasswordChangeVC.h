//
//  PasswordChangeVC.h
//  TeaLife
//
//  Created by fxm on 15/12/15.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLBaseViewController.h"
#import "HLLoginOperation.h"
#import "HLGetVericodeButton.h"
@interface PasswordChangeVC :HLBaseViewController

@property (nonatomic,strong) HLLoginOperation * operation;

@property(nonatomic,weak)IBOutlet UITextField *tf_phone;
@property(nonatomic,weak)IBOutlet UITextField *tf_vcode;
@property(nonatomic,weak)IBOutlet UITextField *tf_pwd;
@property(nonatomic,weak)IBOutlet HLGetVericodeButton *bt_getVcode;
@property(nonatomic,weak)IBOutlet UIButton *bt_send;



- (IBAction)getVercodeAction:(UIButton *)sender;
- (IBAction)getSend:(UIButton *)sender;

- (void) countDown;

@end
