//
//  PersonalVC.h
//  CikersApp
//
//  Created by fxm on 16/1/2.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalHead.h"
#import "DicUserinfo.h"

@interface PersonalVC : UITableViewController

@property(nonatomic,strong)DicUserinfo *data_obj_info;
@property(nonatomic,strong)IBOutlet PersonalHead *view_head;

@end
