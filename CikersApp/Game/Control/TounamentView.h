//
//  TounamentView.h
//  CikersApp
//
//  Created by fxm on 16/1/18.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicGameinfo.h"

@interface TounamentView : UIView


@property(nonatomic,strong)IBOutlet UIImageView *img_icon;
@property(nonatomic,strong)IBOutlet UILabel *lb_name;
@property(nonatomic,strong)IBOutlet UILabel *lb_address;
@property(nonatomic,strong)IBOutlet UILabel *lb_describe;
@property(nonatomic,strong)IBOutlet UILabel *lb_note;


@property(nonatomic,strong)IBOutlet UIView *view_bnts;
@property(nonatomic,strong)IBOutlet UIView *view_tags;
@property(nonatomic,strong)IBOutlet UIButton *bt_singup;


@property(nonatomic,strong)void (^clickBlock)(NSInteger tag);
@property(nonatomic,strong)void (^clickSingupBlock)(id sender);


-(void)updateUI:(DicGameinfo*)dic;

-(void)initBnts;

-(void)bnt_item_click:(UIButton*)clicktag;

-(void)updateTagsUI:(NSArray*)dic;

-(IBAction)bnt_singup:(id)sender;


@end
