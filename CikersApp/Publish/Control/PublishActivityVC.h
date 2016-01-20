//
//  PublishActivityVC.h
//  CikersApp
//
//  Created by fxm on 16/1/11.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "HLBaseViewController.h"

@interface PublishActivityVC : HLBaseViewController<UITextViewDelegate>

@property(nonatomic,strong)IBOutlet UILabel *lb_time;
@property(nonatomic,strong)IBOutlet UITextView *tfview_input;
@property(nonatomic,strong)IBOutlet UITextField *lb_address;
@property(nonatomic,strong)IBOutlet UITextField *lb_phone;

-(IBAction)bnt_time:(id)sender;

@end
