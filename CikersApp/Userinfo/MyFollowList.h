//
//  MyFollowList.h
//  CikersApp
//
//  Created by fxm on 16/2/29.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyFollowContent.h"
#import "UserinfoModel.h"
#import "DicUserinfo.h"
typedef void(^MyBlok)(NSInteger);

@interface MyFollowList : UIViewController<UserinfoModelDelegate,UIScrollViewDelegate>

@property(nonatomic,strong)MyFollowContent *view_content;
@property(nonatomic,strong)UserinfoModel *operation;
@property(nonatomic,strong)DicUserinfo *data_user;
@property(nonatomic,strong)NSMutableArray *array_status;

@property(nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic, copy) MyBlok blok;

- (void)scrollViewIndex:(NSInteger)index;

@end
