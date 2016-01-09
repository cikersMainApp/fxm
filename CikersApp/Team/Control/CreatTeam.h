//
//  CreatTeam.h
//  CikersApp
//
//  Created by fxm on 15/12/21.
//  Copyright © 2015年 cikers. All rights reserved.
//

#import "HLBaseViewController.h"
#import "ClityListDatePick.h"
@interface CreatTeam : HLBaseViewController


@property(nonatomic,strong)ClityListDatePick *clity;
@property(nonatomic,strong)NSString *encodedImageStr;


@property(nonatomic,weak)IBOutlet UIButton *bt_img;
@property(nonatomic,weak)IBOutlet UIButton *bt_send;
@property(nonatomic,weak)IBOutlet UIButton *bt_address;
@property(nonatomic,weak)IBOutlet UITextField *tf_name;
@property(nonatomic,weak)IBOutlet UISegmentedControl *seg_type;
@property(nonatomic,weak)IBOutlet UIView *view_segbg;



@property(nonatomic,strong)NSString *selectIcon;

@property(nonatomic,assign)BOOL isSelectOther;//true  false

-(IBAction)bnt_selectImg;
-(IBAction)bnt_selectAddress;
-(IBAction)bnt_send;

-(IBAction)bnt_back;

-(void)segment_action1:(id)sender;

@end
