//
//  UITableViewCell+CellController.m
//  ABTableViewCellController
//
//  Created by Alex Bumbu on 04/07/15.
//  Copyright (c) 2015 Alex Bumbu. All rights reserved.
//

#import "UITableViewCell+CellController.h"
#import <objc/runtime.h>

@implementation UITableViewCell (CellController)

@dynamic cellController;

- (void)updateCellWithObject:(id)object {
    [self.cellController updateCell:self withObject:object];
}

- (void)setCellController:(id<ABTableViewCellController>)cellController {
    objc_setAssociatedObject(self, @selector(cellController), cellController, OBJC_ASSOCIATION_ASSIGN);
}

- (id<ABTableViewCellController>)cellController {
    return objc_getAssociatedObject(self, @selector(cellController));
}

@end
