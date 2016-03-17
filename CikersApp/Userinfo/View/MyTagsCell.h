//
//  MyTagsCell.h
//  CikersApp
//
//  Created by fxm on 16/3/1.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicTags.h"
#import "DicPlayerinfo.h"
@interface MyTagsCell : UITableViewCell


@property(nonatomic,copy)void (^celldelblock)(NSInteger tag);
@property(nonatomic,copy)void (^cellPlayerblock)(DicPlayerinfo*obj);
@property(nonatomic,copy)void (^cellsupport)(NSInteger tag);




@property(nonatomic,strong)UIButton *bt_support; //
@property(nonatomic,strong)UIButton *bt_del; //删除tag

@property(nonatomic,strong)DicTags *data_obj;


-(void)cell_init;
-(void)cell_updata:(DicTags*)dic;

@end
