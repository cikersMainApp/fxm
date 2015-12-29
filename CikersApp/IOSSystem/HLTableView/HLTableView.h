//
//  HLTableView.h
//  TeaLife
//
//  Created by administrater on 15/12/2.
//  Copyright © 2015年 administrater. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HLTableViewDelegate <NSObject>

- (void) touchTable;

@end
@interface HLTableView : UITableView
@property (nonatomic,weak) id<HLTableViewDelegate> hlDelegate;
@end
