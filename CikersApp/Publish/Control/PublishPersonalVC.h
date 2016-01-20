//
//  PublishPersonalVC.h
//  CikersApp
//
//  Created by fxm on 16/1/11.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "HLBaseViewController.h"
#import "PublishModel.h"
#import "TZImagePickerController.h"
@interface PublishPersonalVC : HLBaseViewController<UITextViewDelegate,PublishModelDelegate>

@property(nonatomic,strong)IBOutlet UITextView *tfview_input;
@property(nonatomic,strong)IBOutlet UIView *view_bg;

@property(nonatomic,strong)NSMutableArray *array_imgs;
@property(nonatomic,strong)NSMutableArray *array_bnt;
@property(nonatomic,strong)NSMutableArray *array_marks;


@property(nonatomic,strong)IBOutlet UIView *view_cellbg;
@property(nonatomic,strong)UIView *view_imgsbg;
@property(nonatomic,strong)UIView *view_cell1;
@property(nonatomic,strong)UIView *view_cell2;
@property(nonatomic,strong)NSString *str_selectUser;

@property(nonatomic,strong)TZImagePickerController *imagePickerVc;


-(void)initUI;
-(void)reloadImgsView;

-(void)openSelect:(id)sender;
-(void)bt_del:(UIButton*)sender;


-(IBAction)bnt_publish:(id)sender;

@end
