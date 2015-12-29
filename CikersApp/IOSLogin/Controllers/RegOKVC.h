//
//  RegOKVC.h
//  CikersApp
//
//  Created by fxm on 15/12/20.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "HLBaseViewController.h"
#import "Api.h"
@interface RegOKVC : HLBaseViewController

@property(nonatomic,strong)IBOutlet UITextField *tf_name;
@property(nonatomic,strong)IBOutlet UIButton *bt_img;
@property(nonatomic,strong)NSString *encodedImageStr;

@property(nonatomic,strong)Api *api;


-(IBAction)bnt_selectImg;
-(IBAction)bnt_selectOver;
@end
