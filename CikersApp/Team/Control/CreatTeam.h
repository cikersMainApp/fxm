//
//  CreatTeam.h
//  CikersApp
//
//  Created by fxm on 15/12/21.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "HLBaseViewController.h"

@interface CreatTeam : HLBaseViewController



@property(nonatomic,strong)NSString *encodedImageStr;


@property(nonatomic,weak)IBOutlet UIButton *bt_img;
@property(nonatomic,weak)IBOutlet UIButton *bt_send;
@property(nonatomic,weak)IBOutlet UIButton *bt_address;
@property(nonatomic,weak)IBOutlet UITextField *tf_name;
@property(nonatomic,weak)IBOutlet UISegmentedControl *seg_type;

@property (nonatomic ,strong)IBOutlet UIPickerView *cityPicker;
@property (nonatomic,strong)IBOutlet UIView *view_picbg;
-(IBAction)returnOkaddress;
-(IBAction)returnCanceladdress;
-(IBAction)bnt_selectImg;
-(IBAction)bnt_selectAddress;
-(IBAction)bnt_send;

-(IBAction)bnt_back;

@end
