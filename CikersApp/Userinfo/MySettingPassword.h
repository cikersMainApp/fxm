//
//  MySettingPassword.h
//  CikersApp
//
//  Created by fxm on 16/2/28.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicUserinfo.h"
@interface MySettingPassword : UITableViewController


@property(nonatomic,strong)IBOutlet UILabel *lb_name;
@property(nonatomic,strong)IBOutlet UITextField *tf_pwold;
@property(nonatomic,strong)IBOutlet UITextField *tf_pwnew;
@property(nonatomic,strong)IBOutlet UITextField *tf_pwcomfirm;

@property(nonatomic,strong)DicUserinfo *data_userinfo;

@end
