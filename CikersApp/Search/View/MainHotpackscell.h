//
//  MainHotpackscell.h
//  CikersApp
//
//  Created by fxm on 16/1/21.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainHotpackscell : UITableViewCell

@property(nonatomic,strong)UILabel *lb_info;

-(void)updateUI:(id)dic type:(NSInteger)type;

@end
