//
//  MyTagsTBView.h
//  CikersApp
//
//  Created by fxm on 16/2/27.
//  Copyright © 2016年 cikers. All rights reserved.
//


typedef enum : NSUInteger {
    TAG_PLAYER,
    TAG_TEAM,
    TAG_GAME,
} TAGTYPE;


#import <UIKit/UIKit.h>
#import "UserinfoModel.h"
#import "DicUserinfo.h"
@interface MyTagsTBView : UITableViewController<UserinfoModelDelegate>

@property(nonatomic,strong)NSMutableArray *data_obj;
@property(nonatomic,strong)UserinfoModel *operation;
@property(nonatomic,strong)DicUserinfo *data_userinfo;

@property(nonatomic,strong)UIView *view_footerbg; //底部吐槽框背景
@property(nonatomic,strong)UITextField *tf_tag;  //

@property(nonatomic,assign)NSInteger num_delTxag;


@property(nonatomic,strong)NSNumber *num_userid;
-(void)initOperation:(NSString*)urlTag;

@end
