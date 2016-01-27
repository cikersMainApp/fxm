//
//  TeamPlayerCell.h
//  CikersApp
//
//  Created by fxm on 16/1/26.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DicPlayerinfo.h"
@interface TeamPlayerCell : UITableViewCell

@property(nonatomic,strong,readonly)UILabel *lb_status;

-(void)updateUI:(DicPlayerinfo*)info;

@end
