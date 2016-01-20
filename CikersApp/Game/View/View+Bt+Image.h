//
//  View+Bt+Image.h
//  CikersApp
//
//  Created by fxm on 16/1/14.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View_Bt_Image : UIView

@property(nonatomic,strong)UIButton *bt;
@property(nonatomic,strong)UILabel *lb;
@property(nonatomic,strong)UIImageView *imageview;



-(instancetype)initWithFrame:(CGRect)frame lable:(NSString*)text imageurl:(NSString *)imageurl;
-(instancetype)initWithFrame:(CGRect)frame lable:(NSString*)text imageurl:(NSString *)imageurl placeholder:(NSString*)placeholder;

-(void)updateUIBylable:(NSString*)text imageurl:(NSString *)imageurl;




@end
