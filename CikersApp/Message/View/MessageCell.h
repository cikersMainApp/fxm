//
//  MessageCell.h
//  CikersApp
//
//  Created by fxm on 16/1/18.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicMessage.h"
@interface MessageCell : UITableViewCell

@property(nonatomic,strong)UILabel *lb_time;
@property(nonatomic,strong)UIView *view_status;
@property(nonatomic,strong)DicMessage *data_obj;

-(void)cellUpdata:(DicMessage*)dic;

@end
