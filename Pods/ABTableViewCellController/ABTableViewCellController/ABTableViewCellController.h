//
//  ABTableViewCellController.h
//  ABTableViewCellController
//
//  Created by Alex Bumbu on 04/07/15.
//  Copyright (c) 2015 Alex Bumbu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ABTableViewCellController <NSObject>

- (void)updateCell:(UITableViewCell *)cell withObject:(id)object;

@end
