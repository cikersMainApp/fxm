//
//  RegVC.h
//  TeaLife
//
//  Created by fxm on 15/12/15.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLBaseViewController.h"
#import "Api.h"
@interface RegVC : HLBaseViewController<UITextFieldDelegate,BaseApiDelegate,CommonCallbackDelegate>

- (IBAction)getVercodeAction:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *bt_send;

//手机号输入框
@property (weak, nonatomic) IBOutlet UITextField *tf_phone;

@end
