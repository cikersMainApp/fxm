//
//  WikiCircleTableview.h
//  CikersApp
//
//  Created by fxm on 16/1/27.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WIkiModel.h"

@class MainWikiVC;

@interface WikiCircleTableview : UITableView<WikiModelDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic ,strong) NSMutableArray *listArry;
@property(nonatomic, strong) WIkiModel *opration;

@property(nonatomic,strong)MainWikiVC *nextvc;
@end
