//
//  WikiInfoMessage.h
//  CikersApp
//
//  Created by fxm on 16/1/28.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicWikiInfo.h"
#import "WIkiModel.h"
#import "DicWikiComments.h"
@interface WikiInfoMessage : UITableViewController<WikiModelDelegate>

@property(nonatomic,strong)DicWikiInfo *data_obj_wiki;
@property(nonatomic,strong)WIkiModel *operation;

@property(nonatomic,strong)NSMutableArray *array_favor;
@property(nonatomic,strong)NSMutableArray *array_comment;


-(void)initOperation;

-(UITableViewCell*)creatRowOne:(UITableViewCell*)cell;
-(UITableViewCell*)creatRowTwo:(UITableViewCell*)cell;
-(UITableViewCell*)creatRowThree:(UITableViewCell *)cell;

@end
