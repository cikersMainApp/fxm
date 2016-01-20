//
//  PublishImageView.m
//  CikersApp
//
//  Created by fxm on 16/1/11.
//  Copyright © 2016年 cikers. All rights reserved.
//

#import "PublishImageView.h"

@implementation PublishImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void)addButtonForUI:(int)tag
{
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt setBackgroundColor:[UIColor orangeColor]];
    [bt setFrame:CGRectMake(0, 0, 20, 20)];
    [self addSubview:bt];
    [bt addTarget:self action:@selector(bnt_click:) forControlEvents:UIControlEventTouchUpInside];
    bt.tag = tag;

}

-(void)bnt_click:(UIButton*)sender
{

    NSInteger tag = sender.tag;
    
    self.clickBytag((int)tag);
    
}
@end
