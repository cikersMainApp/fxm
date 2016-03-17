//
//  MessageEvent.h
//  CikersApp
//
//  Created by fxm on 16/2/26.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
@interface MessageEvent : UITableViewController<MessageModelDelegate>

@property(nonatomic,strong)NSMutableArray *array_infos;
@property(nonatomic,strong)MessageModel *operation;


@end
