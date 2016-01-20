//
//  PublishImageView.h
//  CikersApp
//
//  Created by fxm on 16/1/11.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublishImageView : UIImageView

@property(nonatomic,strong)void (^clickBytag)(int tag);

-(void)bnt_click:(UIButton*)tag;
-(void)addButtonForUI:(int)tag;

@end
