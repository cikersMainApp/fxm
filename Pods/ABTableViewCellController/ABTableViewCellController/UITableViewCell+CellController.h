//
//  UITableViewCell+CellController.h
//  ABTableViewCellController
//
//  Created by Alex Bumbu on 04/07/15.
//  Copyright (c) 2015 Alex Bumbu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABTableViewCellController.h"

@interface UITableViewCell (CellController)

@property (nonatomic, assign) id<ABTableViewCellController> cellController;

- (void)updateCellWithObject:(id)object;

@end
