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
@interface WikiInfoMessage : UITableViewController<WikiModelDelegate>

@property(nonatomic,strong)DicWikiInfo *data_obj_wiki;


-(UITableViewCell*)creatRowOne:(UITableViewCell*)cell;
-(UITableViewCell*)creatRowTwo:(UITableViewCell*)cell;
-(UITableViewCell*)creatRowThree:(UITableViewCell *)cell;

@end
